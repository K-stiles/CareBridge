import { Request, Response, NextFunction } from "express";

import { createAppointment, disableAppointment, modifyAppointment, readAppointment, readallAppointments } from "../services/appointment.service";
import { CreateAppointmentInput, ReadAppointmentInput, UpdateAppointmentInput } from "../schema/appointment.schema";
import { parentError } from "../functions/error";
import logger from "../library/logger";

const NAMESPACE = "Appointment";

/** create Appointment */
export async function addAppointment(req: Request<CreateAppointmentInput["params"], {}, CreateAppointmentInput["body"]>, res: Response) {
    // const patientId = res.locals.patient.id;
    const patientId = req.params.patientId;
    const body = req.body;

    const appointment = await createAppointment({ ...body, patientId });

    return res.status(201).json(appointment);
}

/** get all Appointment */
export const getAppointment = async (req: Request<ReadAppointmentInput["params"]>, res: Response, next: NextFunction) => {
    const appointmentId = req.params?.appointmentId;

    try {
        const appointment = await readAppointment({ id: appointmentId });
        if (!appointment) {
            throw parentError(404, "Requested account information was not found");
        }
        res.status(200).json(appointment);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** get Appointment  */
export const getAppointments = async (req: Request<{}, {}, any, ReadAppointmentInput["query"]>, res: Response, next: NextFunction) => {
    try {
        const take: number = parseInt(req.query.pageSize as string, 10) || 10;
        const skip: number = (parseInt(req.query.page as string, 10) - 1) * take || 0;

        const scheduledDate = req.query.scheduledDate || "";
        const where = {};
        const orderBy = req.query.order;
        const sortBy = req.query.sort;

        // const orderBy = sort && ["asc", "desc"].includes(order) ? { [sort]: order } : { createdAt: 'desc' } ;

        const appointments = await readallAppointments({
            where,
            take,
            skip,
            orderBy: sortBy && ["asc", "desc"].includes(orderBy) ? { [sortBy]: orderBy } : { createdAt: 'desc' }
        });
        if (!appointments) {
            throw parentError(404, "No Appointment Data was found");
        }
        res.status(200).json(appointments);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/**  Update Appointment */
export const updateAppointment = async (req: Request<UpdateAppointmentInput["params"]>, res: Response, next: NextFunction) => {
    try {
        const appointmentId = req.params?.appointmentId;
        const update = req.body;

        const appointment = await readAppointment({ id: appointmentId });

        if (!appointment) {
            throw parentError(404, "Requested account information was not found");
        }

        // const updatedAppointment = await modifyAppointment({ id: appointmentId }, update);

        return res.status(200).json({ message: "appointment updated successfully" });
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};

/** Delete Appointment */
export const deleteAppointment = async (req: Request<UpdateAppointmentInput["params"]>, res: Response, next: NextFunction) => {
    const appointmentId = req.params.appointmentId;
    try {
        // const appointment = await readAppointment({ appointmentId });
        // if (!appointment) {
        //     return parentError(404, "Requested account information was not found");
        // }

        await disableAppointment({ id: appointmentId });
        res.status(200).json("Appointment successfully deleted");
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};
