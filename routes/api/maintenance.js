import express from "express";
import {
  getMaintenance,
  addMaintenance,
  deleteMaintenance,
  updateMaintenance,
} from "../../controllers/maintenance.js";
import { privateRoutes } from "../../middleware/private.js";

const router = express.Router();

router.get("/maintenance", privateRoutes, getMaintenance);
router.post("/maintenance", privateRoutes, addMaintenance);
router.patch("/updateMaintenance/:id", privateRoutes, updateMaintenance);
router.delete("/maintenance/:id", privateRoutes, deleteMaintenance);

export default router;
