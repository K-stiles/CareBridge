import express, { Router } from "express";
const router: Router = express.Router();

import { addDrug, deleteDrug, getDrug, getDrugs, updateDrug } from "../controllers/drug.controller";

router.get("/", getDrugs);
router.post("/", addDrug);
router.get("/:drugId", getDrug);
router.put("/:drugId", updateDrug);
router.delete("/:drugId", deleteDrug);

export default router;
