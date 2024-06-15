import { object, string, TypeOf, array } from "zod";

const payload = {
    body: object({
        name: string({
            required_error: "name is required"
        }),
        description: string({
            required_error: "description is required"
        }),
        doctorId: string({
            required_error: "doctorId is required"
        }),
        patientId: string({
            required_error: "patientId is required"
        }),
        // drugIds: array(string())
        drugIds: array(
            object({
                id: string()
            })
        )
    })
};

const params = {
    params: object({
        prescriptionId: string({
            required_error: "presciptionId is required"
        })
    })
};

const query = {
    query: object({
        // search: string(),
        // service: string(),
        // serviceName: string(),
        createdAt: string(),
        pageSize: string(),
        page: string(),
        sort: string(),
        order: string()
    })
};

export const createPrescriptionSchema = object({
    ...payload
});
export const updatePrescriptionSchema = object({
    ...payload,
    ...params
});

export const deletePrescriptionSchema = object({
    ...params
});

export const getPrescriptionSchema = object({
    ...params,
    ...query
});

export type CreatePrescriptionInput = TypeOf<typeof createPrescriptionSchema>;
export type UpdatePrescriptionInput = TypeOf<typeof updatePrescriptionSchema>;
export type ReadPrescriptionInput = TypeOf<typeof getPrescriptionSchema>;
export type DeletePresciptionInput = TypeOf<typeof deletePrescriptionSchema>;
