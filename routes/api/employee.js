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

router.get("/employee", privateRoutes, getEmployee);
router.post("/employee", multer, addEmployee);
router.patch("/employee/:id", multer, updateEmployee);
router.delete("/employee/:id", deleteEmployee);

export default router;
