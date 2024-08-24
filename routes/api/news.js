import express from "express";
import {
  addNews,
  deleteNews,
  getNews,
  updateNews,
} from "../../controllers/news.js";
import { privateRoutes } from "../../middleware/private.js";
import multer from "../../middleware/multer.js";

const router = express.Router();

router.get("/news", privateRoutes, getNews);
router.post("/news", privateRoutes, multer, addNews);
router.patch("/news/:id", privateRoutes, multer, updateNews);
router.delete("/news/:id", privateRoutes, deleteNews);

export default router;
