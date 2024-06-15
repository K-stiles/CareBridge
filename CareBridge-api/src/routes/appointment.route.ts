import express from "express";
const router = express.Router();

import { updateAppointment, getAppointment, getAppointments, deleteAppointment, addAppointment } from "../controllers/appointment.controller";

router.get("/", getAppointments);
router.post("/:patientId", addAppointment);
router.get("/:appointmentId", getAppointment);
router.put("/:appointmetId", updateAppointment);
router.delete("/:appointmetId", deleteAppointment);

export default router;
