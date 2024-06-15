import express, { Router } from "express";
const router: Router = express.Router();

import { deletePatient, getPatient, getPatients, updatePatient } from "../controllers/patient.controller";

router.get("/", getPatients);
router.get("/:patientId", getPatient);
router.put("/:patientId", updatePatient);
router.delete("/:patientId", deletePatient);

export default router;
