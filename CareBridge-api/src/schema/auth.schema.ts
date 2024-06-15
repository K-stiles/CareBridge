import { boolean, object, string, TypeOf, z } from "zod";

const Gender = z.enum(["MALE", "FEMALE", "OTHER"]);
const Terms = z.enum(["ACCEPTED", "DECLINED"]);

export const createPatientSchema = object({
    body: object({
        fullname: string({ required_error: "Name field is required" })
            .min(3, { message: "Username must be at least 3 characters long" })
            .regex(/^[a-zA-Z\s_]+$/, {
                message: "Username can only contain letters, spaces, and underscores"
            }),
        email: string({ required_error: "Email field is required" }).email(),
        password: string({ required_error: "Password field is required" }).min(6, "Password too short - should be 6 chars minimum"),
        gender: Gender,
        terms: Terms
    })
});

export const createDoctorSchema = object({
    body: object({
        fullname: string({ required_error: "Name field is required" })
            .min(3, { message: "Username must be at least 3 characters long" })
            .regex(/^[a-zA-Z\s_]+$/, {
                message: "Username can only contain letters, spaces, and underscores"
            }),
        email: string({ required_error: "Email field is required" }).email(),
        prn: string({ required_error: "prn field is required" }).min(4, "Invalid prn"),
        gender: Gender,
        terms: Terms,
        specializationId: string({ required_error: "Please select a specialization" })
    })
});

export const loginSchema = object({
    body: object({
        email: string({ required_error: "Email field is required" }),
        password: string({ required_error: "Password field is required" })
    })
});
export const loginDocSchema = object({
    body: object({
        email: string({ required_error: "Email field is required" }),
        prn: string({ required_error: "PRN field is required" })
    })
});

export const authAccess = object({
    body: object({
        accessToken: string({ required_error: "Accesstoken field is required" })
    })
});

export type CreatePatientInput = TypeOf<typeof createPatientSchema>;
export type CreateDoctorInput = TypeOf<typeof createDoctorSchema>;
export type loginDoctorInput = TypeOf<typeof loginDocSchema>;
export type loginInput = TypeOf<typeof loginSchema>;
export type accessTokenInput = TypeOf<typeof authAccess>;
