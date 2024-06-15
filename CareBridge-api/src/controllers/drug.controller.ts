import { Request, Response, NextFunction } from "express";

import { createDrug, disableDrug, modifyDrug, readDrug, readallDrugs } from "../services/drug.service";
import { CreateDrugInput, ReadDrugInput, UpdateDrugInput } from "../schema/drug.schema";
import { parentError } from "../functions/error";
import logger from "../library/logger";

const NAMESPACE = "Drug";

/** create Drug */
export async function addDrug(req: Request<{}, {}, CreateDrugInput["body"]>, res: Response) {
    // const userId = res.locals.user.id;

    const body = req.body;

    const drug = await createDrug({ ...body });

    return res.send(drug);
}

/** get all Drug */
export const getDrug = async (req: Request<ReadDrugInput["params"]>, res: Response, next: NextFunction) => {
    const drugId = req.params?.drugId;
    try {
        const drug = await readDrug({ id: drugId });
        if (!drug) {
            throw parentError(404, "Requested drug information was not found");
        }
        res.status(200).json(drug);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** get Drug  */
export const getDrugs = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const drugs = await readallDrugs({});
        if (!drugs) {
            throw parentError(404, "No Drug Data was found");
        }
        res.status(200).json(drugs);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/**  Update Drug */
export const updateDrug = async (req: Request<UpdateDrugInput["params"]>, res: Response, next: NextFunction) => {
    try {
        const drugId = req.params?.drugId;
        const update = req.body;

        const drug = await readDrug({ id: drugId });

        if (!drug) {
            throw parentError(404, "Requested drug information was not found");
        }

        const updatedDrug = await modifyDrug({ id: drugId }, update);

        return res.status(200).json(updatedDrug);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** Delete Drug */
export const deleteDrug = async (req: Request<UpdateDrugInput["params"]>, res: Response, next: NextFunction) => {
    const drugId = req.params.drugId;
    try {
        // const drug = await readDrug({ drugId });
        // if (!drug) {
        //     return parentError(404, "Requested account information was not found");
        // }

        await disableDrug({ id: drugId });
        res.status(200).json("Drug successfully deleted");
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};
