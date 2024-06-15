import { object, string, TypeOf, z } from "zod";

const Gender = z.enum(["MALE", "FEMALE", "OTHER"]);
export const createAdminSchema = object({
    body: object({
        fullname: string({ required_error: "Name field is required" })
            .min(3, { message: "Username must be at least 3 characters long" })
            .regex(/^[a-zA-Z\s_]+$/, {
                message: "Username can only contain letters, spaces, and underscores"
            }),
        email: string({ required_error: "Email field is required" }).email(),
        password: string({ required_error: "Password field is required" }).min(6, "Password too short - should be 6 chars minimum"),
        gender: Gender
    })
});

export const loginAdminSchema = object({
    body: object({
        email: string({ required_error: "Email is required" }),
        password: string({ required_error: "Password is required" })
    })
});

export type CreateAdminInput = TypeOf<typeof createAdminSchema>;
export type loginAdminInput = TypeOf<typeof loginAdminSchema>;
