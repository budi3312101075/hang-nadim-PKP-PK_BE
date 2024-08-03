import jwt, { decode } from "jsonwebtoken";

export const privateRoutes = async (req, res, next) => {
  let token = req.cookies.token;
  if (!token) {
    return res
      .status(401)
      .json({ success: false, msg: "Anda tidak punya Akses!" });
  }
  try {
    const decoded = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);
    const userDetail = await db.execute(`SELECT * FROM user WHERE id = ?`, [
      decoded.id,
    ]);
    req.user = userDetail[0][0];
    next();
  } catch (error) {
    res.status(500).json({ success: false, msg: error.message });
  }
};
