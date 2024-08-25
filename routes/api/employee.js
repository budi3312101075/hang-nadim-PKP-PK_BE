import express from "express";
import multer from "../../middleware/multer.js";
import {
  addEmployee,
  deleteEmployee,
  getEmployee,
  updateEmployee,
} from "../../controllers/employee.js";
import { privateRoutes } from "../../middleware/private.js";

const router = express.Router();

router.get("/employee", getEmployee);
router.post("/employee", privateRoutes, multer, addEmployee);
router.patch("/employee/:id", privateRoutes, multer, updateEmployee);
router.delete("/employee/:id", privateRoutes, deleteEmployee);

export default router;
