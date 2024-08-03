import multer from "multer";
import { fileDir } from "../utils/tools.cjs";

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, fileDir());
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now().toString();
    cb(null, `${uniqueSuffix}${file.originalname}`);
  },
});

export default multer({ storage: storage }).single("photo");
