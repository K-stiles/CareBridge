import { object, z, string, TypeOf } from "zod";

const Gender = z.enum(["MALE", "FEMALE", "OTHER"]);
const Terms = z.enum(["ACCEPTED", "DECLINED"]);

const payload = {
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
};

const params = {
    params: object({
        doctorId: string({
            required_error: "doctorId is required"
        })
    })
};

const query = {
    query: object({
        // search: string(),
        // service: string(),
        fullname: string(),
        serviceName: string(),
        pageSize: string(),
        page: string(),
        sort: string(),
        order: string()
    })
};

export const updateDoctorSchema = object({
    ...payload,
    ...params
});

export const deleteDoctorSchema = object({
    ...params
});

export const getDoctorSchema = object({
    ...params,
    ...query
});

export type UpdateDoctorInput = TypeOf<typeof updateDoctorSchema>;
export type ReadDoctorInput = TypeOf<typeof getDoctorSchema>;
export type DeleteDoctorInput = TypeOf<typeof deleteDoctorSchema>;
