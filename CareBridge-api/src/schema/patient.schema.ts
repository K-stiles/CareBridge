import { object, string, TypeOf } from "zod";

const payload = {
    body: object({
        fullname: string({ required_error: "Name is required" }),
        email: string({ required_error: "Email is required" }).email(),
        password: string({ required_error: "Password is required" }).min(6, "Password should be a minimum of 6 characters"),
        profile: string({ required_error: "Image is required" })
    })
};

const params = {
    params: object({
        patientId: string({ required_error: "patientId is required" })
    })
};

export const updatePatientSchema = object({
    ...payload,
    ...params
});

export const deletePatientSchema = object({
    ...params
});

export const getPatientSchema = object({
    ...params
});

export type UpdatePatientInput = TypeOf<typeof updatePatientSchema>;
export type ReadPatientInput = TypeOf<typeof getPatientSchema>;
export type DeletePatientInput = TypeOf<typeof deletePatientSchema>;
