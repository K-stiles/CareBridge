import { NextFunction, Request, Response } from "express";

import logger from "../library/logger";
import { createDoctor, createPatient, validatePRN, validatePassword, verifyAuth } from "../services/auth.service";
import { CreateDoctorInput, CreatePatientInput, loginDoctorInput, loginInput } from "../schema/auth.schema";
import { createSession, findSessions, updateSession } from "../services/session.service";

import { parentError } from "../functions/error";
import { signJwt } from "../functions/jwt.function";
import config from "../config/config";
import { generateAccessToken } from "../functions/token.gen";

const NAMESPACE = "Patient/Doctor Authentication";

/**
 * CREATE PATIENNT ACCOUNT AND SENND VERIFICATION EMAIL
 *
 *  */
export async function register(req: Request<{}, {}, CreatePatientInput["body"]>, res: Response, next: NextFunction) {
    try {
        const patient = await createPatient(req.body);

        logger.info(NAMESPACE, patient.email);

        return res.status(201).json({
            succcess: true,
            message: `Account created successfully. An email has been sent to: ${patient.email} please verify the email`,
            patient
        });
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
}

/**
 * CREATE DOCTOR ACCOUNT AND SENND VERIFICATION EMAIL
 *
 *  */
export async function register_doctor(req: Request<{}, {}, CreateDoctorInput["body"]>, res: Response, next: NextFunction) {
    try {
        const doctor = await createDoctor(req.body);

        logger.info(NAMESPACE, doctor.email);

        return res.status(201).json({
            succcess: true,
            message: `Account created successfully. An email has been sent to: ${doctor.email} please verify the email`,
            doctor
        });
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
}

/**
 * UPDATE PATIENT TO VERIFIED
 *
 */
export const authVerificathion = async (req: Request<{}, {}, CreatePatientInput["body"]>, res: Response, next: NextFunction) => {
    try {
        const patient = await verifyAuth(req.body);
        logger.info(NAMESPACE, "Accout verification success");
        return res.status(200).json({ message: "Accout verification success", patient });
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/**
 * PATIENT/DOCTOR LOGIN
 *
 *  */
export async function login(req: Request<{}, {}, loginInput["body"]>, res: Response, next: NextFunction) {
    try {
        const patient = await validatePassword(req.body);

        if (!patient) {
            throw parentError(401, "Invalid email or password");
        }

        /**
         * PATIENT/DOCTOR DYNAMIC SESSION GENERATION
         * DEFAULTING TO PATIENT FOR NOW
         */
        const session = await createSession({ patientId: patient?.id, userAgent: req.get("user-agent") || "" });
        /** TEMP SESSION GENERATOR */
        // const session = { patientId: patient.id, userAgent: req.get("user-agent") || "" };

        /** TEMPORARY ACCESS TOKEN GENERATOR */
        const accessToken = generateAccessToken(patient);
        const refreshToken = generateAccessToken(patient);

        // const accessToken = signJwt(
        //     { ...patient, session: session?.patientId },
        //     "serverAccessTokenPrivateKey",
        //     { expiresIn: config.server.token.serverAccessTokenTTL } // 15 minutes,
        // );

        // const refreshToken = signJwt(
        //     { ...patient, session: session.patientId },
        //     "serverRefreshTokenPrivateKey",
        //     { expiresIn: config.server.token.serverRefreshTokenTTL } // 15 minutes
        // );

        logger.info(NAMESPACE, accessToken);
        res.cookie("refreshToken", refreshToken, { maxAge: 90000, httpOnly: true });
        return res.status(200).json({
            succcess: true,
            patient,
            session,
            accessToken
        });
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
}
export async function login_doctor(req: Request<{}, {}, loginDoctorInput["body"]>, res: Response, next: NextFunction) {
    try {
        const doctor = await validatePRN(req.body);

        if (!doctor) {
            throw parentError(401, "Invalid email or password");
        }

        /**
         * DOCTOR/DOCTOR DYNAMIC SESSION GENERATION
         * DEFAULTING TO DOCTOR FOR NOW
         */
        const session = await createSession({ doctorId: doctor?.id, userAgent: req.get("user-agent") || "" });
        /** TEMP SESSION GENERATOR */
        // const session = { doctorId: doctor.id, userAgent: req.get("user-agent") || "" };

        /** TEMPORARY ACCESS TOKEN GENERATOR */
        const accessToken = generateAccessToken(doctor);
        const refreshToken = generateAccessToken(doctor);

        // const accessToken = signJwt(
        //     { ...doctor, session: session.doctorId },
        //     "serverAccessTokenPrivateKey",
        //     { expiresIn: config.server.token.serverAccessTokenTTL } // 15 minutes,
        // );

        // const refreshToken = signJwt(
        //     { ...doctor, session: session.doctorId },
        //     "serverRefreshTokenPrivateKey",
        //     { expiresIn: config.server.token.serverRefreshTokenTTL } // 15 minutes
        // );

        logger.info(NAMESPACE, accessToken);
        res.cookie("refreshToken", refreshToken, { maxAge: 9000, httpOnly: true });
        return res.status(200).json({
            succcess: true,
            doctor,
            session,
            accessToken
        });
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
}

/** GET CURRENTLY LOGGED_IN PATIENT/DOCTOR SESSION */
export async function getSessionsHandler(req: Request, res: Response, next: NextFunction) {
    try {
        const sessionId = res.locals?.patient.id || res.locals?.doctor.id || res.locals?.admin.id;
        const sessions = await findSessions({ where: { id: sessionId } });
        logger.info(NAMESPACE, sessionId);
        return res.status(200).json(sessions);
    } catch (error) {
        next(error);
    }
}

/** LOGOUT/DELETE CURRENT PATIENT/DOCTOR SESSION */
export async function deleteSessionHandler(req: Request, res: Response, next: NextFunction) {
    try {
        const sessionId = res.locals.patient.session;
        await updateSession({ id: sessionId }, { valid: false, userAgent: req.get("user-agent") || "" });
        logger.info(NAMESPACE, sessionId);
        return res.send({ accessToken: null, refreshToken: null });
    } catch (error) {
        next(error);
    }
}

/**
 * PATIENT/ DOCTOR LOGOUT TEMP
 *
 * */
export const logout = async (req: Request, res: Response, next: NextFunction) => {
    try {
        res.status(200).json({ message: "Logout was successful" });
    } catch (error) {
        next(error);
    }
};

/**
 * Forgot Password
 *
 *
 */

/**
 *  Reset Password
 *
 * */
