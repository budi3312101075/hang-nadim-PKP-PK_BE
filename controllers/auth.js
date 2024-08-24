import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import { query } from "../utils/query.js";
import { dateValue, uuid } from "../utils/tools.cjs";

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
      return res.status(400).json("Employees already have accounts!");
    }

    if (isUserExist.length > 0) {
      return res.status(400).json("Username already exist!");
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

      return res.status(200).json({ message: "data successfully added" });
    }
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const login = async (req, res) => {
  const { username, password } = req.body;
  try {
    if (username === undefined || password === undefined) {
      return res.status(400).json("Invalid data!");
    }

    const cekUser = await query(
      `SELECT username ,password FROM user WHERE username = ? AND is_deleted = 0`,
      [username]
    );

    if (cekUser.length === 0) {
      return res.status(400).json("Username not found!");
    }

    const isPasswordMatch = await bcrypt.compare(password, cekUser[0].password);
    if (!isPasswordMatch) {
      return res.status(400).json({ msg: "Password wrong" });
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
