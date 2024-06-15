import { Request, Response, NextFunction } from "express";

import { createMedicalInfo, disableMedicalInfo, modifyMedicalInfo, readMedicalInfo, readallMedicalInfos } from "../services/medicalInfo.service";
import { CreateMedicalInfoInput, ReadMedicalInfoInput, UpdateMedicalInfoInput } from "../schema/medicalInfo.schema";
import { parentError } from "../functions/error";
import logger from "../library/logger";

const NAMESPACE = "MedicalInfo";

/** create MedicalInfo */
export async function addMedicalInfo(req: Request<{}, {}, CreateMedicalInfoInput["body"]>, res: Response, next: NextFunction) {
    try {
        // const userId = res.locals.user.id;
        const body = req.body;
        const medicalInfo = await createMedicalInfo({ ...body });

        res.status(201).json(medicalInfo);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
}

/** get all MedicalInfo */
export const getMedicalInfo = async (req: Request<ReadMedicalInfoInput["params"]>, res: Response, next: NextFunction) => {
    const medicalInfoId = req.params?.medicalInfoId;
    try {
        const medicalInfo = await readMedicalInfo({ id: medicalInfoId });
        if (!medicalInfo) {
            throw parentError(404, "Requested medicalInfo information was not found");
        }
        res.status(200).json(medicalInfo);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** get MedicalInfo  */
export const getMedicalInfos = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const medicalInfos = await readallMedicalInfos({});
        if (!medicalInfos) {
            throw parentError(404, "No MedicalInfo Data was found");
        }
        res.status(200).json(medicalInfos);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/**  Update MedicalInfo */
export const updateMedicalInfo = async (req: Request<UpdateMedicalInfoInput["params"]>, res: Response, next: NextFunction) => {
    try {
        const medicalInfoId = req.params?.medicalInfoId;
        const update = req.body;
        const medicalInfo = await readMedicalInfo({ id: medicalInfoId });

        if (!medicalInfo) {
            throw parentError(404, "Requested medicalInfo information was not found");
        }

        const updatedMedicalInfo = await modifyMedicalInfo({ id: medicalInfoId }, update);

        return res.status(200).json(updatedMedicalInfo);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** Delete MedicalInfo */
export const deleteMedicalInfo = async (req: Request<UpdateMedicalInfoInput["params"]>, res: Response, next: NextFunction) => {
    const medicalInfoId = req.params.medicalInfoId;
    try {
        // const medicalInfo = await readMedicalInfo({ medicalInfoId });
        // if (!medicalInfo) {
        //     return parentError(404, "Requested account information was not found");
        // }

        await disableMedicalInfo({ id: medicalInfoId });
        res.status(200).json("MedicalInfo successfully deleted");
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};
