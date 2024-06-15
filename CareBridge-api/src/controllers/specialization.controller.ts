import { Request, Response, NextFunction } from "express";

import { createSpecialization, disableSpecialization, modifySpecialization, readSpecialization, readallSpecializations } from "../services/specialization.service";
import { CreateSpecializationInput, ReadSpecializationInput, UpdateSpecializationInput } from "../schema/specialization.schema";
import { parentError } from "../functions/error";

const NAMESPACE = "Specialization";

/** create Specialization */
export async function addSpecialization(req: Request<{}, {}, CreateSpecializationInput["body"]>, res: Response) {
    // const userId = res.locals.user.id;

    const body = req.body;

    const specialization = await createSpecialization({ ...body });

    return res.send(specialization);
}

/** get all Specialization */
export const getSpecialization = async (req: Request<ReadSpecializationInput["params"]>, res: Response, next: NextFunction) => {
    const specializationId = req.params?.specializationId;
    try {
        const specialization = await readSpecialization({ id: specializationId });
        if (!specialization) {
            throw parentError(404, "Requested specialization information was not found");
        }
        res.status(200).json(specialization);
    } catch (error) {
        next(error);
    }
};

/** get Specialization  */
export const getSpecializations = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const specializations = await readallSpecializations({});
        if (!specializations) {
            throw parentError(404, "No Specialization Data was found");
        }
        res.status(200).json(specializations);
    } catch (error) {
        next(error);
    }
};

/**  Update Specialization */
export const updateSpecialization = async (req: Request<UpdateSpecializationInput["params"]>, res: Response, next: NextFunction) => {
    try {
        const specializationId = req.params?.specializationId;
        const update = req.body;

        const specialization = await readSpecialization({ id: specializationId });

        if (!specialization) {
            throw parentError(404, "Requested specialization information was not found");
        }

        const updatedSpecialization = await modifySpecialization({ id: specializationId }, update);

        return res.status(200).json(updatedSpecialization);
    } catch (error) {
        next(error);
    }
};

/** Delete Specialization */
export const deleteSpecialization = async (req: Request<UpdateSpecializationInput["params"]>, res: Response, next: NextFunction) => {
    const specializationId = req.params.specializationId;
    try {
        // const specialization = await readSpecialization({ specializationId });
        // if (!specialization) {
        //     return parentError(404, "Requested account information was not found");
        // }

        await disableSpecialization({ id: specializationId });
        res.status(200).json("Specialization successfully deleted");
    } catch (error) {
        next(error);
    }
};
