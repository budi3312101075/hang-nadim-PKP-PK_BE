import ImageKit from "imagekit";
import dotenv from "dotenv";

dotenv.config();

const imagekit = new ImageKit({
  publicKey: process.env.PUBLICKEY, // Ganti dengan Public Key Anda
  privateKey: process.env.PRIVATEKEY, // Ganti dengan Private Key Anda
  urlEndpoint: process.env.URLENDPOINT, // Ganti dengan URL Endpoint Anda
});

export default imagekit;
