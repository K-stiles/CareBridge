import express, { Router } from "express";
const router: Router = express.Router();

import { addService, addServices, deleteService, getService, getServices, updateService } from "../controllers/service.controller";

router.get("/", getServices);
router.post("/", addService);
router.post("/many", addServices);
router.get("/:serviceId", getService);
router.put("/:serviceId", updateService);
router.delete("/:serviceId", deleteService);

export default router;
