import { Request, Response, NextFunction } from "express";

import { disableAdministrator, modifyAdministrator, readAdministrator, readallAdministrators } from "../services/administrator.service";
import { ReadAdministratorInput, UpdateAdministratorInput } from "../schema/administrator.schema";
import { parentError } from "../functions/error";
import logger from "../library/logger";

const NAMESPACE = "Administrator";

/** get all Administrator */
export const getAdministrator = async (req: Request<ReadAdministratorInput["params"]>, res: Response, next: NextFunction) => {
    const administratorId = req.params?.administratorId;
    try {
        const administrator = await readAdministrator({ id: administratorId });
        if (!administrator) {
            throw parentError(404, "Requested account information was not found");
        }
        res.status(200).json(administrator);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** get Administrator  */
export const getAdministrators = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const administrators = await readallAdministrators({
            orderBy: {
                createdAt: "desc"
            }
        });
        if (!administrators) {
            throw parentError(404, "No Administrator Data was found");
        }
        res.status(200).json(administrators);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/**  Update Administrator */
export const updateAdministrator = async (req: Request<UpdateAdministratorInput["params"]>, res: Response, next: NextFunction) => {
    try {
        const administratorId = req.params?.administratorId;
        const update = req.body;

        const administrator = await readAdministrator({ id: administratorId });

        if (!administrator) {
            throw parentError(404, "Requested account information was not found");
        }

        const updatedAdministrator = await modifyAdministrator({ id: administratorId }, update);

        return res.status(200).json(updatedAdministrator);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** Delete Administrator */
export const deleteAdministrator = async (req: Request<UpdateAdministratorInput["params"]>, res: Response, next: NextFunction) => {
    const administratorId = req.params.administratorId;
    try {
        await disableAdministrator({ id: administratorId });
        res.status(200).json("Account successfully deleted");
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};
