import express from "express";
import {
  addNews,
  deleteNews,
  getNews,
  getNewsById,
  updateNews,
} from "../../controllers/news.js";
import { privateRoutes } from "../../middleware/private.js";

const router = express.Router();

router.get("/news", privateRoutes, getNews);
router.get("/news/:id", privateRoutes, getNewsById);
router.post("/news", privateRoutes, addNews);
router.patch("/news/:id", privateRoutes, updateNews);
router.delete("/news/:id", privateRoutes, deleteNews);

export default router;
