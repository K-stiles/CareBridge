import { get, omit } from "lodash";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import { Prisma } from "@prisma/client";
import { CreatePatientInput } from "../schema/auth.schema";

type PatientQuery = {
    where?: Prisma.PatientWhereInput;
    orderBy?: Prisma.PatientOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

export async function readallPatients(query: PatientQuery) {
    try {
        const patients = await prisma.patient.findMany(query);

        if (!patients) return false;
        /**TODO: LOOP THROUGH AND TAKE OUT PASSWORD FIELD */
        return patients;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function readPatient(query: Prisma.PatientWhereUniqueInput) {
    try {
        const patient = await prisma.patient.findUnique({ where: query });
        if (!patient) throw parentError(404, "Account Data Not Found");
        return omit(patient, "password");
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function modifyPatient(query: Prisma.PatientWhereUniqueInput, update: CreatePatientInput["body"]) {
    try {
        const patient = await prisma.patient.update({
            where: query,
            data: update
        });
        if (!patient) throw parentError(404, "Account Data Not Found");
        return omit(patient, "password");
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function disablePatient(query: Prisma.PatientWhereUniqueInput) {
    try {
        const patient = await prisma.patient.update({
            where: query,
            data: { disabled: true }
        });
        if (!patient) throw parentError(404, "Account Data Not Found");
        return omit(patient, "password");
    } catch (error: any) {
        throw parentError(400, error);
    }
}
