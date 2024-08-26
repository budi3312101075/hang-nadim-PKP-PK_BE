import imagekit from "../middleware/imageKit.js";
import { query } from "../utils/query.js";
import { dateValue, uuid } from "../utils/tools.cjs";

export const getEmployee = async (req, res) => {
  try {
    const data = await query(
      `SELECT uuid as id, name, position, division, photo, no_sk FROM employee WHERE is_deleted = 0`
    );

    const bravo = await query(
      `SELECT uuid as id, name, position, division, photo, no_sk FROM employee WHERE division = 'bravo' AND is_deleted = 0`
    );

    const charlie = await query(
      `SELECT uuid as id, name, position, division, photo, no_sk FROM employee WHERE division = 'charlie' AND is_deleted = 0`
    );

    const alpha = await query(
      `SELECT uuid as id, name, position, division, photo, no_sk FROM employee WHERE division = 'alpha' AND is_deleted = 0`
    );

    return res
      .status(200)
      .json({ data: data, bravo: bravo, charlie: charlie, alpha: alpha });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const addEmployee = async (req, res) => {
  const { name, position, division, noSk } = req.body;
  try {
    if (
      name === "" ||
      position === "" ||
      division === "" ||
      noSk === "" ||
      name === undefined ||
      position === undefined ||
      division === undefined ||
      noSk === undefined
    ) {
      return res.status(400).json("Invalid data!");
    }

    if (req.file === undefined) {
      return res.status(400).json({ msg: "No file uploaded" });
    }

    const { buffer, originalname, size } = req.file;
    const fileSize = size;
    if (fileSize > 5000000) {
      return res.status(422).json({ msg: "Image must be smaller than 5MB" });
    }

    const result = await imagekit.upload({
      file: buffer, // Buffer dari file yang di-upload
      fileName: originalname, // Nama file yang di-upload
      folder: "Hangnadim",
    });

    await query(
      `INSERT INTO employee (uuid, name, position, division, photo, no_sk, is_deleted, created_at, updated_at) VALUES (?, ?, ?, ?,?, ?, ?, ?, ?)`,
      [
        uuid(),
        name,
        position,
        division,
        result.url,
        noSk,
        0,
        dateValue(),
        dateValue(),
      ]
    );
    return res.status(200).json({ message: "data successfully added" });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const updateEmployee = async (req, res) => {
  const { name, position, division, noSk } = req.body;
  const { id } = req.params;
  try {
    if (
      name === undefined ||
      position === undefined ||
      division === undefined ||
      noSk === undefined
    ) {
      return res.status(400).json("Invalid data!");
    }

    if (req.file === undefined) {
      await query(
        `UPDATE employee SET name = ?, position = ?, division = ?, no_sk = ?, updated_at = ? WHERE uuid = ?`,
        [name, position, division, noSk, dateValue(), id]
      );

      return res.status(200).json({ message: "data successfully updated" });
    } else {
      const { buffer, originalname, size } = req.file;
      const fileSize = size;
      if (fileSize > 5000000) {
        return res.status(422).json({ msg: "Image must be smaller than 5MB" });
      }

      const result = await imagekit.upload({
        file: buffer, // Buffer dari file yang di-upload
        fileName: originalname, // Nama file yang di-upload
        folder: "Hangnadim",
      });

      await query(
        `UPDATE employee SET name = ?, position = ?, division = ?, no_sk = ?, photo = ?, updated_at = ? WHERE uuid = ?`,
        [name, position, division, noSk, result.url, dateValue(), id]
      );
      return res.status(200).json({ message: "data successfully updated" });
    }
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const deleteEmployee = async (req, res) => {
  const { id } = req.params;
  try {
    const cekUser = await query(
      `SELECT id_employee FROM user WHERE id_employee = ? AND is_deleted = 0`,
      [id]
    );

    if (cekUser.length > 0) {
      await query(
        `UPDATE user SET is_deleted = 1, updated_at = ? WHERE id_employee = ?`,
        [dateValue(), cekUser[0].id_employee]
      );
      await query(
        `UPDATE employee SET is_deleted = 1, updated_at = ? WHERE uuid = ?`,
        [dateValue(), id]
      );
      return res
        .status(200)
        .json({ message: "data user and employee successfully deleted" });
    }

    await query(
      `UPDATE employee SET is_deleted = 1, updated_at = ? WHERE uuid = ?`,
      [dateValue(), id]
    );
    return res.status(200).json({ message: "data successfully deleted" });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};
