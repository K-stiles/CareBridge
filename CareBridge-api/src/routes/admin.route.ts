import express from "express";
const router = express.Router();

import { deleteAdministrator, getAdministrator, getAdministrators, updateAdministrator } from "../controllers/admin.controller";

router.get("/", getAdministrators);
router.get("/:administratorId", getAdministrator);
router.put("/:administratorId", updateAdministrator);
router.delete("/:administratorId", deleteAdministrator);

export default router;
