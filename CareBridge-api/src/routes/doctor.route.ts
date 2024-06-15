import express, { Router } from "express";
const router: Router = express.Router();
import Auth from "../middleware/Auth";
import canAccess from "../middleware/canAccess";
import config from "../config/config";

import { deleteDoctor, getDoctor, getDoctors, updateDoctor } from "../controllers/doctor.controller";

router.get("/", getDoctors);
router.get("/:doctorId", getDoctor);
router.put("/:doctorId", Auth, canAccess(config.server.permissions.UPDATE_DOCTOR), updateDoctor);
router.delete("/:doctorId", Auth, canAccess(config.server.permissions.DELETE_DOCTOR), deleteDoctor);

export default router;
