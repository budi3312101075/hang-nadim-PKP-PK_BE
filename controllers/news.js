import { query } from "../utils/query.js";
import { uuid, dateValue } from "../utils/tools.cjs";

export const getNews = async (req, res) => {
  try {
    const data = await query(
      `SELECT n.uuid, n.title, n.description, n.photo, n.created_At, e.name FROM 
      news n INNER JOIN user u ON n.id_user = u.uuid 
      INNER JOIN employee e ON e.uuid = u.id_employee WHERE n.is_deleted = 0`
    );

    return res.status(200).json(data);
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const addNews = async (req, res) => {
  const { title, description } = req.body;
  const userId = req.user.uuid;
  try {
    if (
      title === "" ||
      description === "" ||
      title === undefined ||
      description === undefined
    ) {
      return res.status(400).json("Invalid data!");
    }

    if (req.file === undefined) {
      return res.status(400).json({ msg: "No file uploaded" });
    }

    const { filename: photo, size } = req.file;
    const fileSize = size;
    if (fileSize > 5000000) {
      return res.status(422).json({ msg: "Image must be smaller than 5MB" });
    }

    await query(
      `INSERT INTO news (uuid, title, description, photo, is_deleted, id_user, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
      [uuid(), title, description, photo, 0, userId, dateValue(), dateValue()]
    );

    return res.status(200).json({ message: "data successfully added" });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const updateNews = async (req, res) => {
  const { title, description } = req.body;
  const userId = req.user.uuid;
  const { id } = req.params;
  try {
    if (
      title === "" ||
      description === "" ||
      title === undefined ||
      description === undefined
    ) {
      return res.status(400).json("Invalid data!");
    }

    if (req.file === undefined) {
      await query(
        `UPDATE news SET title = ?, description = ?, id_user = ?, updated_at = ? WHERE uuid = ?`,
        [title, description, userId, dateValue(), id]
      );

      return res.status(200).json({ message: "data successfully updated" });
    } else {
      const { filename: photo, size } = req.file;
      const fileSize = size;
      if (fileSize > 5000000) {
        return res.status(422).json({ msg: "Image must be smaller than 5MB" });
      }

      await query(
        `UPDATE news SET title = ?, description = ?, photo = ?, id_user = ?, updated_at = ? WHERE uuid = ?`,
        [title, description, photo, userId, dateValue(), id]
      );

      return res.status(200).json({ message: "data successfully updated" });
    }
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const deleteNews = async (req, res) => {
  const { id } = req.params;
  try {
    await query(
      `UPDATE news SET is_deleted = ?, updated_at = ? WHERE uuid = ?`,
      [1, dateValue(), id]
    );
    return res.status(200).json({ message: "data successfully deleted" });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};
