import express, { Router } from "express";
const router: Router = express.Router();

import { addSpecialization, deleteSpecialization, getSpecialization, getSpecializations, updateSpecialization } from "../controllers/specialization.controller";

router.get("/", getSpecializations);
router.post("/", addSpecialization);
router.get("/:specializationId", getSpecialization);
router.put("/:specializationId", updateSpecialization);
router.delete("/:specializationId", deleteSpecialization);

export default router;
