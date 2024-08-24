import express from "express";
import { deleteUser, getUsers, register } from "../../controllers/users.js";
import { privateRoutes } from "../../middleware/private.js";

const router = express.Router();

router.post("/register", register);

router.get("/users", privateRoutes, getUsers);
router.delete("/users/:id", privateRoutes, deleteUser);

export default router;
