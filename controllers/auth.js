import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import { query } from "../utils/query.js";

export const login = async (req, res) => {
  const { username, password } = req.body;
  try {
    if (username === undefined || password === undefined) {
      return res.status(400).json("Invalid data!");
    }

    const cekUser = await query(
      `SELECT username, password, id_employee FROM user WHERE username = ? AND is_deleted = 0`,
      [username]
    );

    if (cekUser.length === 0) {
      return res.status(400).json("Username tidak ditemukan!");
    }

    const isPasswordMatch = await bcrypt.compare(password, cekUser[0].password);
    if (!isPasswordMatch) {
      return res.status(400).json("Password Salah");
    }

    const cekEmploye = await query(
      `SELECT uuid FROM employee WHERE uuid = ? AND is_deleted = 0`,
      [cekUser[0].id_employee]
    );

    if (cekEmploye.length === 0) {
      return res.status(400).json("Anda Bukan Karyawan");
    }

    const user = await query(
      `SELECT uuid, id_employee as idEmployee, is_admin FROM user WHERE username = ? AND is_deleted = 0`,
      [username]
    );

    const payload = {
      idUser: user[0].uuid,
      idEmployee: user[0].idEmployee,
      role: user[0].is_admin,
    };
    const token = jwt.sign(payload, process.env.ACCESS_TOKEN_SECRET, {
      expiresIn: "1d",
    });
    const options = {
      httpOnly: true,
      maxAge: 3600000 * 1 * 24,
    };

    return res
      .status(200)
      .cookie("token", token, options)
      .json({ success: true, data: token });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const getMe = async (req, res) => {
  const { uuid } = req.user;
  try {
    const [getMe] = await query(
      `SELECT u.uuid, u.username, u.is_admin , e.name, e.position,e.photo,e.no_sk FROM 
      user u INNER JOIN employee e 
      ON u.id_employee = e.uuid 
      WHERE u.uuid = ?  AND u.is_deleted = 0`,
      [uuid]
    );

    return res.status(200).json({ success: true, getMe });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const Logout = async (req, res) => {
  try {
    res
      .status(200)
      .clearCookie("token")
      .json({ success: true, msg: "Logout Berhasil!" });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};
