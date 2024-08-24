import express from "express";
import { getMe, login, Logout } from "../../controllers/auth.js";
import { privateRoutes } from "../../middleware/private.js";

const router = express.Router();

router.post("/login", login);
router.get("/getMe", privateRoutes, getMe);
router.get("/logout", Logout);

export default router;
