import { Request, Response, NextFunction } from "express";

import { disableDoctor, modifyDoctor, readDoctor, readallDoctors } from "../services/doctor.service";
import { ReadDoctorInput, UpdateDoctorInput } from "../schema/doctor.schema";
import { parentError } from "../functions/error";
import logger from "../library/logger";

const NAMESPACE = "Doctor";

/** get all Doctor */
export const getDoctor = async (req: Request<ReadDoctorInput["params"], {}, any, ReadDoctorInput["query"]>, res: Response, next: NextFunction) => {
    const doctorId = req.params?.doctorId;
    try {
        const doctor = await readDoctor({ id: doctorId });
        if (!doctor) {
            throw parentError(404, "Requested account information was not found");
        }
        res.status(200).json(doctor);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** get Doctor  */
export const getDoctors = async (req: Request<{}, {}, any, ReadDoctorInput["query"]>, res: Response, next: NextFunction) => {
    try {
        const take: number = parseInt(req.query.pageSize as string, 10) || 10; // limit to 10 at a time
        const skip: number = (parseInt(req.query.page as string, 10) - 1) * take || 0; // page

        const fullname = req.query.fullname || "";
        const serviceName = req.query.serviceName || "";

        const where = {
            OR: [
                { fullname: { contains: fullname } }
            ]
        };

        const orderBy = req.query.order;
        const sortBy = req.query.sort;
        // const orderBy = req.query.sort && ["asc", "desc"].includes(req.query.order) ? { [req.query.sort]: req.query.order } : { createdAt: "desc" };

        const doctors = await readallDoctors({
            where,
            take,
            skip,
            orderBy: sortBy && ["asc", "desc"].includes(orderBy) ? { [sortBy]: orderBy } : { createdAt: "asc" }
        });
        if (!doctors) {
            throw parentError(404, "No Doctor Data was found");
        }

        res.status(200).json(doctors);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/**  Update Doctor */
export const updateDoctor = async (req: Request<UpdateDoctorInput["params"]>, res: Response, next: NextFunction) => {
    try {
        const doctorId = req.params?.doctorId;
        const update = req.body;

        const doctor = await readDoctor({ id: doctorId });

        if (!doctor) {
            throw parentError(404, "Requested account information was not found");
        }

        const updatedDoctor = await modifyDoctor({ id: doctorId }, update);

        return res.status(200).json(updatedDoctor);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** Delete Doctor */
export const deleteDoctor = async (req: Request<UpdateDoctorInput["params"]>, res: Response, next: NextFunction) => {
    const doctorId = req.params.doctorId;
    try {
        await disableDoctor({ id: doctorId });
        res.status(200).json("Account successfully deleted");
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};
