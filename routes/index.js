import express from "express";
import employee from "./employee.js";
import auth from "./auth.js";

const app = express();

const api = "/api/v1";

app.use(api, employee);
app.use(api, auth);

export default app;
