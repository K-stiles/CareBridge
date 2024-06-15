import { get } from "lodash";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import { Prisma } from "@prisma/client";
import { CreateAppointmentInput } from "../schema/appointment.schema";

type AppointmentQuery = {
    where?: Prisma.AppointmentWhereInput;
    orderBy?: Prisma.AppointmentOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

export async function createAppointment(payload: CreateAppointmentInput["body"]) {
    const scheduledDate = new Date(payload.scheduledDate);
    const data = { ...payload, scheduledDate };
    return await prisma.appointment.create({
        data
        // include: {
        //     service: {
        //         select: {
        //             name: true
        //         }
        //     },
        //     patient: {
        //         select: {
        //             fullname: true
        //         }
        //     }
        // }
    });
}

export async function readallAppointments(query: AppointmentQuery) {
    try {
        const appointments = await prisma.appointment.findMany({
            ...query,
            
            include: {
                patient: {
                    select: {
                        fullname: true
                    }
                }
            }
        });

        if (!appointments) return false;

         const totalDoctors = await prisma.appointment.count({ where: query.where });

        return appointments;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function readAppointment(query: Prisma.AppointmentWhereUniqueInput) {
    try {
        const appointment = await prisma.appointment.findUnique({
            where: query
        });
        if (!appointment) throw parentError(404, "Account Data Not Found");
        return appointment;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function modifyAppointment(query: Prisma.AppointmentWhereUniqueInput, update: CreateAppointmentInput["body"]) {
    try {
        const appointment = await prisma.appointment.update({
            where: query,
            data: update
            // include: {
            //     service: {
            //         select: {
            //             name: true
            //         }
            //     },
            //     patient: {
            //         select: {
            //             fullname: true
            //         }
            //     }
            // }
        });
        if (!appointment) throw parentError(404, "Account Data Not Found");
        return appointment;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function disableAppointment(query: Prisma.AppointmentWhereUniqueInput) {
    try {
        const appointment = await prisma.appointment.update({
            where: query,
            data: { removed: true }
        });
        if (!appointment) throw parentError(404, "Account Data Not Found");
        return appointment;
    } catch (error: any) {
        throw parentError(400, error);
    }
}
