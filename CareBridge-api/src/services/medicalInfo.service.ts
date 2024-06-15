import { get } from "lodash";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import { Prisma } from "@prisma/client";
import { CreateMedicalInfoInput } from "../schema/medicalInfo.schema";

type MedicalInfoQuery = {
    where?: Prisma.MedicalInfoWhereInput;
    orderBy?: Prisma.MedicalInfoOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

export async function createMedicalInfo(payload: CreateMedicalInfoInput["body"]) {
    const date: Date = payload.dateOfBirth || new Date();
    const dateOfBirth = new Date(date);
    const data = { ...payload, dateOfBirth };
    return await prisma.medicalInfo.create({ data });
}

export async function readallMedicalInfos(query: MedicalInfoQuery) {
    try {
        const medicalInfos = await prisma.medicalInfo.findMany(query);
        if (!medicalInfos) return false;
        return medicalInfos;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function readMedicalInfo(query: Prisma.MedicalInfoWhereUniqueInput) {
    try {
        const medicalInfo = await prisma.medicalInfo.findUnique({ where: query });
        if (!medicalInfo) throw parentError(404, "Account Data Not Found");
        return medicalInfo;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function modifyMedicalInfo(query: Prisma.MedicalInfoWhereUniqueInput, update: CreateMedicalInfoInput["body"]) {
    try {
        const medicalInfo = await prisma.medicalInfo.update({
            where: query,
            data: update
        });
        if (!medicalInfo) throw parentError(404, "Account Data Not Found");
        return medicalInfo;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function disableMedicalInfo(query: Prisma.MedicalInfoWhereUniqueInput) {
    try {
        const medicalInfo = await prisma.medicalInfo.update({
            where: query,
            data: { removed: true }
        });
        if (!medicalInfo) throw parentError(404, "Account Data Not Found");
        return medicalInfo;
    } catch (error: any) {
        throw parentError(400, error);
    }
}
