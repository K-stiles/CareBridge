import { get } from "lodash";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import { Prisma } from "@prisma/client";
import { CreateSpecializationInput } from "../schema/specialization.schema";

type SpecializationQuery = {
    where?: Prisma.SpecializationWhereInput;
    orderBy?: Prisma.SpecializationOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

export async function createSpecialization(data: CreateSpecializationInput["body"]) {
    return await prisma.specialization.create({ data });
}

export async function readallSpecializations(query: SpecializationQuery) {
    try {
        const specializations = await prisma.specialization.findMany(query);

        if (!specializations) return false;
        return specializations;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function readSpecialization(query: Prisma.SpecializationWhereUniqueInput) {
    try {
        const specialization = await prisma.specialization.findUnique({ where: query });
        if (!specialization) throw parentError(404, "Account Data Not Found");
        return specialization;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function modifySpecialization(query: Prisma.SpecializationWhereUniqueInput, update: CreateSpecializationInput["body"]) {
    try {
        const specialization = await prisma.specialization.update({
            where: query,
            data: update
        });
        if (!specialization) throw parentError(404, "Account Data Not Found");
        return specialization;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function disableSpecialization(query: Prisma.SpecializationWhereUniqueInput) {
    try {
        const specialization = await prisma.specialization.update({
            where: query,
            data: { removed: true }
        });
        if (!specialization) throw parentError(404, "Account Data Not Found");
        return specialization;
    } catch (error: any) {
        throw parentError(400, error);
    }
}
