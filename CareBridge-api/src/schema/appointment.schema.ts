import { date, object, string, TypeOf, z } from "zod";

const Medium = z.enum(["CHAT", "VOICE_CALL", "VIDEO_CALL"]);

const payload = {
    body: object({
        complaint: string({ required_error: "Complaint is required" }),
        scheduledDate: string({ required_error: "Please select a date" }),
        patientId: string({ required_error: "Patient Id is required" }),
        serviceId: string({ required_error: "Service Id is required" }),
        medium: Medium
    })
};

const params = {
    params: object({
        appointmentId: string({ required_error: "validation error - appointmentId is required" }),
        patientId: string({ required_error: "validation error - patientId is required" })
    })
};


const query = {
    query: object({
        scheduledDate: string(),
        medium: string(),
        createdAt: date(),
        pageSize: string(),
        page: string(),
        sort: string(),
        order: string()
    })
};

export const createAppointmentSchema = object({
    ...payload,
    ...params
});
export const updateAppointmentSchema = object({
    ...payload,
    ...params
});

export const deleteAppointmentSchema = object({
    ...params
});

export const getAppointmentSchema = object({
    ...params,
    ...query
});

export type CreateAppointmentInput = TypeOf<typeof createAppointmentSchema>;
export type UpdateAppointmentInput = TypeOf<typeof updateAppointmentSchema>;
export type ReadAppointmentInput = TypeOf<typeof getAppointmentSchema>;
export type DeleteAppointmentInput = TypeOf<typeof deleteAppointmentSchema>;
