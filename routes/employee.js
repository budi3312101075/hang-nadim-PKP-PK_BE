import express from "express";
import multer from "../middleware/multer.js";
import {
  addEmployee,
  deleteEmployee,
  getEmployee,
  updateEmployee,
} from "../controllers/employee.js";

const router = express.Router();

router.get("/employee", getEmployee);
router.post("/employee", multer, addEmployee);
router.patch("/updateEmployee/:id", multer, updateEmployee);
router.patch("/employee/:id", deleteEmployee);

export default router;
