import express from "express";
import employee from "./employee.js";
import auth from "./auth.js";
import car from "./car.js";
import maintenance from "./maintenance.js";

const app = express();

const api = "/api/v1";

app.use(api, employee);
app.use(api, auth);
app.use(api, car);
app.use(api, maintenance);

export default app;
