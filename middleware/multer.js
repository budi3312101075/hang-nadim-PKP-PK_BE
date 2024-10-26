import multer from "multer";
import { fileDir } from "../utils/tools.cjs";
import path from "path";

// Tentukan konfigurasi penyimpanan `diskStorage`
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, fileDir()); // Pastikan direktori yang dikembalikan ada
  },
  filename: function (req, file, cb) {
    const validMimeTypes = ["image/jpeg", "image/png", "image/gif"];
    if (!validMimeTypes.includes(file.mimetype)) {
      return cb(new Error("Invalid file type"), false);
    }

    const uniqueSuffix = Date.now().toString();
    cb(null, `${uniqueSuffix}-${file.originalname}`);
  },
});

export default multer({ storage: storage }).single("photo");
