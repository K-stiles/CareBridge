import express, { Router } from "express";
const router: Router = express.Router();

import { addPrescription, deletePrescription, getPrescription, getPrescriptions, updatePrescription } from "../controllers/prescription.controller";

router.get("/", getPrescriptions);
router.post("/", addPrescription);
router.get("/:prescriptionId", getPrescription);
router.put("/:prescriptionId", updatePrescription);
router.delete("/:prescriptionId", deletePrescription);

export default router;
