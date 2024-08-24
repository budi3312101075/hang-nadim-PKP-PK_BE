import { query } from "../utils/query.js";
import { dateValue, uuid } from "../utils/tools.cjs";
import bcrypt from "bcrypt";

export const register = async (req, res) => {
  const { username, password, isAdmin, idEmployee } = req.body;
  try {
    if (
      username === undefined ||
      password === undefined ||
      isAdmin === undefined ||
      idEmployee === undefined ||
      username === "" ||
      password === "" ||
      idEmployee === ""
    ) {
      return res.status(400).json("Invalid data!");
    }

    const isUserExist = await query(
      `SELECT username FROM user WHERE username = ? AND is_deleted = 0`,
      [username]
    );

    const isEmployee = await query(
      `SELECT id_employee FROM user WHERE id_employee = ? AND is_deleted = 0`,
      [idEmployee]
    );

    if (isEmployee.length > 0) {
      return res.status(400).json("Karyawan sudah memiliki akun!");
    }

    if (isUserExist.length > 0) {
      return res.status(400).json("Username sudah digunakan!");
    } else {
      const salt = await bcrypt.genSalt();
      const hashedPassword = await bcrypt.hash(password, salt);

      await query(
        `INSERT INTO user 
          (uuid, username, password, is_admin, is_deleted, id_employee, created_at, updated_at) values 
          (?, ?, ?, ?, ?, ?, ?, ?)`,
        [
          uuid(),
          username,
          hashedPassword,
          isAdmin,
          0,
          idEmployee,
          dateValue(),
          dateValue(),
        ]
      );

      return res.status(200).json({ message: "Berhasil register" });
    }
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const getUsers = async (req, res) => {
  try {
    const data = await query(
      `SELECT u.uuid ,e.photo, u.username, 
    CASE WHEN u.is_admin = 0 THEN 'Karyawan'
        WHEN u.is_admin = 1 THEN 'Admin'
    END AS role, e.name, e.division 
        FROM user u INNER JOIN employee e 
        ON u.id_employee = e.uuid WHERE u.is_deleted = 0;`
    );
    return res.status(200).json(data);
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const deleteUser = async (req, res) => {
  const { id } = req.params;
  try {
    await query(
      `UPDATE user SET is_deleted = ?, updated_at = ? WHERE uuid = ?`,
      [1, dateValue(), id]
    );
    return res.status(200).json({ message: "data successfully deleted" });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const ubahRole = async (req, res) => {
  const { id } = req.params;
  try {
    const cekRole = await query(
      `SELECT is_admin FROM user WHERE uuid = ? AND is_deleted = 0`,
      [id]
    );

    if (cekRole[0].is_admin === 1) {
      await query(
        `UPDATE user SET is_admin = ?, updated_at = ? WHERE uuid = ?`,
        [0, dateValue(), id]
      );
      return res.status(200).json({ message: "User menjadi karyawan" });
    } else if (cekRole[0].is_admin === 0) {
      await query(
        `UPDATE user SET is_admin = ?, updated_at = ? WHERE uuid = ?`,
        [1, dateValue(), id]
      );
      return res.status(200).json({ message: "User menjadi admin" });
    }

    return res.status(400).json({ message: "Gagal mengubah role" });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};
