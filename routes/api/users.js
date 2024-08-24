import express from "express";
import {
  deleteUser,
  getUsers,
  register,
  ubahRole,
} from "../../controllers/users.js";
import { privateRoutes } from "../../middleware/private.js";

const router = express.Router();

router.post("/register", register);

router.get("/users", privateRoutes, getUsers);
router.get("/ubahRole/:id", privateRoutes, ubahRole);
router.delete("/users/:id", privateRoutes, deleteUser);

export default router;
