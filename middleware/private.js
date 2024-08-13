import jwt, { decode } from "jsonwebtoken";
import { query } from "../utils/query.js";

export const privateRoutes = async (req, res, next) => {
  let token = req.cookies.token;
  if (!token) {
    return res
      .status(401)
      .json({ success: false, msg: "Anda tidak punya Akses!" });
  }
  try {
    const decoded = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);

    const userDetail = await query(
      `SELECT u.uuid, u.username, u.is_admin, e.name, e.position,e.photo,e.no_sk FROM 
      user u INNER JOIN employee e 
      ON u.id_employee = e.uuid 
      WHERE u.uuid = ?  AND u.is_deleted = 0`,
      [decoded.idUser]
    );
    req.user = userDetail[0];
    next();
  } catch (error) {
    res.status(500).json({ success: false, msg: error.message });
  }
};
