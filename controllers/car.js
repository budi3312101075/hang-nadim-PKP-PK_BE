import { query } from "../utils/query.js";
import { dateValue, uuid } from "../utils/tools.cjs";
import imagekit from "../middleware/imageKit.js";

export const getCar = async (req, res) => {
  try {
    const data = await query(
      `SELECT uuid as id, name, type, photo FROM car WHERE is_deleted = 0`
    );
    return res.status(200).json(data);
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const addCar = async (req, res) => {
  const { name, type } = req.body;
  try {
    if (name === undefined || type === undefined) {
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
      `INSERT INTO car (uuid, name, type, photo, is_deleted, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [uuid(), name, type, result.url, 0, dateValue(), dateValue()]
    );

    return res.status(200).json({ message: "data successfully added" });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const updateCar = async (req, res) => {
  const { name, type } = req.body;
  const { id } = req.params;
  try {
    if (name === undefined || type === undefined) {
      return res.status(400).json("Invalid data!");
    }

    if (req.file === undefined) {
      await query(
        `UPDATE car SET name = ?, type = ?, updated_at = ? WHERE uuid = ?`,
        [name, type, dateValue(), id]
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
        `UPDATE car SET name = ?, type = ?, photo = ?, updated_at = ? WHERE uuid = ?`,
        [name, type, result.url, dateValue(), id]
      );
      return res.status(200).json({ message: "data successfully updated" });
    }
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const deleteCar = async (req, res) => {
  const { id } = req.params;
  try {
    await query(
      `UPDATE car SET is_deleted = ?, updated_at = ? WHERE uuid = ?`,
      [1, dateValue(), id]
    );
    return res.status(200).json({ message: "data successfully deleted" });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};
