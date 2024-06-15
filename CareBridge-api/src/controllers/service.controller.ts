import { Request, Response, NextFunction } from "express";

import { createManyServices, createService, disableService, modifyService, readService, readallServices } from "../services/service.service";
import { CreateManyServicesInput, CreateServiceInput, ReadServiceInput, UpdateServiceInput } from "../schema/service.schema";
import { parentError } from "../functions/error";

const NAMESPACE = "Service";

/** create Service */
export async function addService(req: Request<{}, {}, CreateServiceInput["body"]>, res: Response) {
    // const userId = res.locals.user.id;

    const body = req.body;

    const service = await createService({ ...body });

    return res.send(service);
}

/** create Many Services */
export async function addServices(req: Request<{}, {}, CreateManyServicesInput["body"]>, res: Response) {
    // const userId = res.locals.user.id;

    const body = req.body;
    const service = await createManyServices(body);

    return res.send(service);
}

/** get all Service */
export const getService = async (req: Request<ReadServiceInput["params"]>, res: Response, next: NextFunction) => {
    const serviceId = req.params?.serviceId;
    try {
        const service = await readService({ id: serviceId });
        if (!service) {
            throw parentError(404, "Requested service information was not found");
        }
        res.status(200).json(service);
    } catch (error) {
        next(error);
    }
};

/** get Service  */
export const getServices = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const services = await readallServices({});
        if (!services) {
            throw parentError(404, "No Service Data was found");
        }
        res.status(200).json(services);
    } catch (error) {
        next(error);
    }
};

/**  Update Service */
export const updateService = async (req: Request<UpdateServiceInput["params"]>, res: Response, next: NextFunction) => {
    try {
        const serviceId = req.params?.serviceId;
        const update = req.body;

        const service = await readService({ id: serviceId });

        if (!service) {
            throw parentError(404, "Requested service information was not found");
        }

        const updatedService = await modifyService({ id: serviceId }, update);

        return res.status(200).json(updatedService);
    } catch (error) {
        next(error);
    }
};

/** Delete Service */
export const deleteService = async (req: Request<UpdateServiceInput["params"]>, res: Response, next: NextFunction) => {
    const serviceId = req.params.serviceId;
    try {
        // const service = await readService({ serviceId });
        // if (!service) {
        //     return parentError(404, "Requested account information was not found");
        // }

        await disableService({ id: serviceId });
        res.status(200).json("Service successfully deleted");
    } catch (error) {
        next(error);
    }
};
