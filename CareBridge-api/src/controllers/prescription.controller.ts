import { Request, Response, NextFunction } from "express";

import { createPrescription, disablePrescription, modifyPrescription, readPrescription, readallPrescriptions } from "../services/prescreption.service";
import { CreatePrescriptionInput, ReadPrescriptionInput, UpdatePrescriptionInput } from "../schema/prescription.schema";
import { parentError } from "../functions/error";
import logger from "../library/logger";

const NAMESPACE = "Prescription";

/** create Prescription */
export async function addPrescription(req: Request<{}, {}, CreatePrescriptionInput["body"]>, res: Response) {
    // const userId = res.locals.user.id;

    const body = req.body;
    // const data = {
    //         doctor: { connect: { id: "" } },
    //         patient: { connect: { id: "" } },
    //         name:"",
    //         description:"",
    //         drugs:{connect: [].map((e)=>({id:""}))}
    //     }

    const prescription = await createPrescription({ ...body });

    return res.send(prescription);
}

/** get all Prescription */
export const getPrescription = async (req: Request<ReadPrescriptionInput["params"]>, res: Response, next: NextFunction) => {
    const prescriptionId = req.params?.prescriptionId;
    try {
        const prescription = await readPrescription({ id: prescriptionId });
        if (!prescription) {
            throw parentError(404, "Requested prescription information was not found");
        }
        res.status(200).json(prescription);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** get Prescription  */
export const getPrescriptions = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const prescriptions = await readallPrescriptions({});
        if (!prescriptions) {
            throw parentError(404, "No Prescription Data was found");
        }
        res.status(200).json(prescriptions);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/**  Update Prescription */
export const updatePrescription = async (req: Request<UpdatePrescriptionInput["params"]>, res: Response, next: NextFunction) => {
    try {
        const prescriptionId = req.params?.prescriptionId;
        const update = req.body;

        const prescription = await readPrescription({ id: prescriptionId });

        if (!prescription) {
            throw parentError(404, "Requested prescription information was not found");
        }

        const updatedPrescription = await modifyPrescription({ id: prescriptionId }, update);

        return res.status(200).json(updatedPrescription);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** Delete Prescription */
export const deletePrescription = async (req: Request<UpdatePrescriptionInput["params"]>, res: Response, next: NextFunction) => {
    const prescriptionId = req.params.prescriptionId;
    try {
        // const prescription = await readPrescription({ prescriptionId });
        // if (!prescription) {
        //     return parentError(404, "Requested account information was not found");
        // }

        await disablePrescription({ id: prescriptionId });
        res.status(200).json("Prescription successfully deleted");
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};
