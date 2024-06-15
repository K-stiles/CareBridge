import express, { Router } from "express";
const router: Router = express.Router();

import { paymentConfirmationCallback, processPayment } from "../controllers/paymentGateway.controller";

router.post("/callback/paymentConfirmationCallback", paymentConfirmationCallback);
router.get("/:paymentId", processPayment);

export default router;
