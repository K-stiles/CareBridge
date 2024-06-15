import { object, number, string, TypeOf } from "zod";

const payload = {
    body: object({
        email: string({ required_error: "Email is required" }),
        username: string({ required_error: "Name is required" }),
        phone: string({ required_error: "Phone is required" }),
        password: string({ required_error: "Password is required" }).min(6, "Password should be a minimum of 6 characters"),
        profile: string({ required_error: "Image is required" })
    })
};

const params = {
    params: object({
        administratorId: string({ required_error: "administratorId is required" })
    })
};

export const updateAdministratorSchema = object({
    ...payload,
    ...params
});

export const deleteAdministratorSchema = object({
    ...params
});

export const getAdministratorSchema = object({
    ...params
});

export type UpdateAdministratorInput = TypeOf<typeof updateAdministratorSchema>;
export type ReadAdministratorInput = TypeOf<typeof getAdministratorSchema>;
export type DeleteAdministratorInput = TypeOf<typeof deleteAdministratorSchema>;
