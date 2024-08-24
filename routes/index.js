import express from "express";
import employee from "./api/employee.js";
import auth from "./api/auth.js";
import car from "./api/car.js";
import maintenance from "./api/maintenance.js";
import news from "./api/news.js";

const app = express();

const api = "/api/v1";

app.use(api, employee);
app.use(api, auth);
app.use(api, car);
app.use(api, maintenance);
app.use(api, news);

export default app;
