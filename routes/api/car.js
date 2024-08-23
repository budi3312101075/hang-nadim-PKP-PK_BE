import express from "express";
import multer from "../../middleware/multer.js";
import { getCar, addCar, updateCar, deleteCar } from "../../controllers/car.js";

const router = express.Router();

router.get("/car", getCar);
router.post("/car", multer, addCar);
router.patch("/car/:id", multer, updateCar);
router.delete("/car/:id", deleteCar);

export default router;
