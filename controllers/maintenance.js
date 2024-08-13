import { uuid, dateValue } from "../utils/tools.cjs";
import { query } from "../utils/query.js";
import dayjs from "dayjs";
import isBetween from "dayjs/plugin/isBetween.js";
dayjs.extend(isBetween);

export const getMaintenance = async (req, res) => {
  try {
    const data = await query(
      `SELECT m.uuid as id, c.name, c.type, c.photo, m.type as jenisPerbaikan, m.description, m.date_in, m.date_out 
      FROM maintenance m INNER JOIN car c 
      ON m.id_car = c.uuid WHERE m.is_deleted = 0`
    );
    return res.status(200).json(data);
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};

export const addMaintenance = async (req, res) => {
  const { type, description, dateIn, dateOut, idCar } = req.body;
  const userId = req.user.uuid;
  try {
    if (
      type === undefined ||
      description === undefined ||
      dateIn === undefined ||
      dateOut === undefined ||
      idCar === undefined
    ) {
      return res
        .status(400)
        .json({ message: "Invalid data. All fields are required." });
    }

    const cekCar = await query(
      `SELECT date_in, date_out FROM maintenance WHERE id_car = ? AND is_deleted = 0 ORDER BY date_out DESC LIMIT 1`,
      [idCar]
    );

    if (cekCar.length > 0) {
      const dayjsLastDateIn = dayjs(cekCar[0].date_in);
      const dayjsLastDateOut = dayjs(cekCar[0].date_out);
      const currentDate = dayjs();

      if (
        currentDate.isBetween(dayjsLastDateIn, dayjsLastDateOut, "day", "[)")
      ) {
        return res.status(400).json({
          message: "the car is being repaired",
          data: { currentDate, dayjsLastDateIn, dayjsLastDateOut },
        });
      }
    }

    await query(
      `INSERT INTO maintenance 
      (uuid, type, description, date_in, date_out, is_deleted, id_car, id_user, created_at, updated_at) 
      VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?)`,
      [
        uuid(),
        type,
        description,
        dateIn,
        dateOut,
        0,
        idCar,
        userId,
        dateValue(),
        dateValue(),
      ]
    );

    return res.status(200).json({ message: "Maintenance added successfully" });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

export const updateMaintenance = async (req, res) => {
  const { type, description, dateIn, dateOut } = req.body;
  const { id } = req.params;
  try {
    if (
      type === undefined ||
      description === undefined ||
      dateIn === undefined ||
      dateOut === undefined
    ) {
      return res
        .status(400)
        .json({ message: "Invalid data. All fields are required." });
    }

    const cekData = await query(
      `SELECT * FROM maintenance WHERE uuid = ? AND is_deleted = 0`,
      [id]
    );
    if (cekData.length === 0) {
      return res.status(400).json({ message: "data not found" });
    }

    await query(
      `UPDATE maintenance SET type = ?, description = ?, date_in = ?, date_out = ?, updated_at = ? WHERE uuid = ?`,
      [type, description, dateIn, dateOut, dateValue(), id]
    );

    return res.status(200).json({ message: "data successfully updated" });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

export const deleteMaintenance = async (req, res) => {
  const { id } = req.params;
  try {
    await query(
      `UPDATE maintenance SET is_deleted = ?, updated_at = ? WHERE uuid = ?`,
      [1, dateValue(), id]
    );
    return res.status(200).json({ message: "data successfully deleted" });
  } catch (error) {
    return res.status(400).json({ message: error.message });
  }
};
