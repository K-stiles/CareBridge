import express, { Router } from "express";
const router: Router = express.Router();

import { addMedicalInfo, deleteMedicalInfo, getMedicalInfo, getMedicalInfos, updateMedicalInfo } from "../controllers/medical.controller";

router.get("/", getMedicalInfos);
router.post("/", addMedicalInfo);
router.get("/:medicalInfoId", getMedicalInfo);
router.put("/:medicalInfoId", updateMedicalInfo);
router.delete("/:medicalInfoId", deleteMedicalInfo);

export default router;
