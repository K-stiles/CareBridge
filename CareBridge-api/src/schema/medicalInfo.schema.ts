import { object, string, TypeOf, date, boolean, number } from "zod";

const payload = {
    body: object({
        patientId: string({ required_error: "patient Id is required" }),

        height: number({ invalid_type_error: "Height must be a number", }).optional(),
        weight: number({ invalid_type_error: "Weight must be a number" }).optional(),
        dateOfBirth: date({ invalid_type_error: "That's not a date!" }).optional(),
        location: string({ invalid_type_error: "Invalid Location input" }).optional(),

        chronicDiseaseStatus: boolean({ invalid_type_error: "chronicDiseaseStatus must be a boolean", }).optional(),
        chronicDiseaseInfo: string({ required_error: "Name of MedicalInfo is required" }).optional(),

        allergiesStatus: boolean({ invalid_type_error: "allergiesStatus must be a boolean", }).optional(),
        allergiesInfo: string({ required_error: "Name of MedicalInfo is required" }).optional(),

        medicalConditionStatus: boolean({ invalid_type_error: "medicalConditionStatus must be a boolean", }).optional(),
        medicalConditionInfo: string({ required_error: "Name of MedicalInfo is required" }).optional()
    })
};

const params = {
    params: object({
        medicalInfoId: string({ required_error: "validation error - medicalInfoId is required" })
    })
};

export const createMedicalInfoSchema = object({
    ...payload
});
export const updateMedicalInfoSchema = object({
    ...payload,
    ...params
});

export const deleteMedicalInfoSchema = object({
    ...params
});

export const getMedicalInfoSchema = object({
    ...params
});

export type CreateMedicalInfoInput = TypeOf<typeof createMedicalInfoSchema>;
export type UpdateMedicalInfoInput = TypeOf<typeof updateMedicalInfoSchema>;
export type ReadMedicalInfoInput = TypeOf<typeof getMedicalInfoSchema>;
export type DeleteMedicalInfoInput = TypeOf<typeof deleteMedicalInfoSchema>;
