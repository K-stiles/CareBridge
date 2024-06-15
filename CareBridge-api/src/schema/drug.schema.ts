import { object, string, TypeOf, date } from "zod";

const payload = {
    body: object({
        name: string({ required_error: "Name of Drug is required" }),
        dosage: string({ required_error: "drug description is required" })
    })
};

const params = {
    params: object({
        drugId: string({ required_error: "validation error - drugId is required" })
    })
};

export const createDrugSchema = object({
    ...payload
});
export const updateDrugSchema = object({
    ...payload,
    ...params
});

export const deleteDrugSchema = object({
    ...params
});

export const getDrugSchema = object({
    ...params
});

export type CreateDrugInput = TypeOf<typeof createDrugSchema>;
export type UpdateDrugInput = TypeOf<typeof updateDrugSchema>;
export type ReadDrugInput = TypeOf<typeof getDrugSchema>;
export type DeleteDrugInput = TypeOf<typeof deleteDrugSchema>;
