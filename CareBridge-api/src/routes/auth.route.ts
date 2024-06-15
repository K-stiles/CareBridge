import express from "express";

import { register, authVerificathion, logout, login, register_doctor, login_doctor, getSessionsHandler } from "../controllers/auth.controller";
import { createDoctorSchema, createPatientSchema, loginDocSchema, loginSchema } from "../schema/auth.schema";
import resourceValidator from "../middleware/validate.resource";
import { register_admin, login_admin, logout_admin } from "../controllers/adminAuth.controller";
import { createAdminSchema, loginAdminSchema } from "../schema/adminAuth.schema";

const router = express.Router();

/**
 * PATIENT/DOCTOR AUTHENTICATION
 *
 *  */
router.post("/register", resourceValidator(createPatientSchema), register);
router.post("/login", resourceValidator(loginSchema), login);
router.put("/verification", resourceValidator(createPatientSchema), authVerificathion);
router.post("/register-doctor", resourceValidator(createDoctorSchema), register_doctor);
router.post("/login-doctor", resourceValidator(loginDocSchema), login_doctor);
router.put("/verification-doctor", resourceValidator(createPatientSchema), authVerificathion);
router.put("/current-user", getSessionsHandler);
router.get("/logout", logout);

/**
 * PATIENT/ DOCTOR
 * PASSWORD MANAGEMENT  ROUTE
 *
 *  */
// router.get("/resetPassword", resetPassword);
// router.get("/forgotPassword", forgotPassword);

/**
 * ADMIN AUTHENTICATION
 *
 *  */
router.post("/register-admin", resourceValidator(createAdminSchema), register_admin);
router.post("/login-admin", resourceValidator(loginAdminSchema), login_admin);
router.get("/logout-admin", logout_admin);

/**
 * ADMIN PASSWORD MANAGEMENT  ROUTE
 *
 *  */
// router.get("/resetPassword", resetPassword);
// router.get("/forgotPassword", forgotPassword);

export default router;
