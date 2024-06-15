import { object, number, string, TypeOf, date, array } from "zod";

const payload = {
    body: object({
        name: string({
            required_error: "Service Name is required"
        })
    })
};
const more_services_payload = {
    body: object({
        name: string({
            required_error: "Name is required"
        })
    }).array()
};

const params = {
    params: object({
        serviceId: string({
            required_error: "serviceId is required"
        })
    })
};

export const createServiceSchema = object({
    ...payload
});
export const createManyServicesSchema = object({
    ...more_services_payload
});

export const updateServiceSchema = object({
    ...payload,
    ...params
});

export const deleteServiceSchema = object({
    ...params
});

export const getServiceSchema = object({
    ...params
});

export type CreateServiceInput = TypeOf<typeof createServiceSchema>;
export type CreateManyServicesInput = TypeOf<typeof createManyServicesSchema>;
export type UpdateServiceInput = TypeOf<typeof updateServiceSchema>;
export type ReadServiceInput = TypeOf<typeof getServiceSchema>;
export type DeleteServiceInput = TypeOf<typeof deleteServiceSchema>;
