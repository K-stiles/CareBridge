import { object, string, TypeOf, date } from "zod";

const payload = {
    body: object({
        name: string({ required_error: "Name of Specialization is required" })
    })
};

const params = {
    params: object({
        specializationId: string({ required_error: "validation error - specializationId is required" })
    })
};

export const createSpecializationSchema = object({
    ...payload
});
export const updateSpecializationSchema = object({
    ...payload,
    ...params
});

export const deleteSpecializationSchema = object({
    ...params
});

export const getSpecializationSchema = object({
    ...params
});

export type CreateSpecializationInput = TypeOf<typeof createSpecializationSchema>;
export type UpdateSpecializationInput = TypeOf<typeof updateSpecializationSchema>;
export type ReadSpecializationInput = TypeOf<typeof getSpecializationSchema>;
export type DeleteSpecializationInput = TypeOf<typeof deleteSpecializationSchema>;
