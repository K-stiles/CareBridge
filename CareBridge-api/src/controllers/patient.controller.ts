import { Request, Response, NextFunction } from "express";

import { disablePatient, modifyPatient, readPatient, readallPatients } from "../services/patient.service";
import { ReadPatientInput, UpdatePatientInput } from "../schema/patient.schema";
import { parentError } from "../functions/error";
import logger from "../library/logger";

const NAMESPACE = "Patient";

/** get all Patient */
export const getPatient = async (req: Request<ReadPatientInput["params"]>, res: Response, next: NextFunction) => {
    const patientId = req.params?.patientId;
    try {
        const patient = await readPatient({ id: patientId });
        if (!patient) {
            throw parentError(404, "Requested account information was not found");
        }
        res.status(200).json(patient);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** get Patient  */
export const getPatients = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const patients = await readallPatients({
            orderBy: {
                createdAt: "desc"
            }
        });
        if (!patients) {
            throw parentError(404, "No Patient Data was found");
        }
        res.status(200).json(patients);
    }catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/**  Update Patient */
export const updatePatient = async (req: Request<UpdatePatientInput["params"]>, res: Response, next: NextFunction) => {
    try {
        const patientId = req.params?.patientId;
        const update = req.body;

        const patient = await readPatient({ id: patientId });

        if (!patient) {
            throw parentError(404, "Requested account information was not found");
        }

        const updatedPatient = await modifyPatient({ id: patientId }, update);

        return res.status(200).json(updatedPatient);
    }catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** Delete Patient */
export const deletePatient = async (req: Request<UpdatePatientInput["params"]>, res: Response, next: NextFunction) => {
    const patientId = req.params.patientId;
    try {
        await disablePatient({ id: patientId });
        res.status(200).json("Account successfully deleted");
    }catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};
