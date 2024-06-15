import { get } from "lodash";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import { Prisma } from "@prisma/client";
import { CreateDrugInput } from "../schema/drug.schema";

type DrugQuery = {
    where?: Prisma.DrugWhereInput;
    orderBy?: Prisma.DrugOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

export async function createDrug(data: CreateDrugInput["body"]) {
    return await prisma.drug.create({ data });
}

export async function readallDrugs(query: DrugQuery) {
    try {
        const drugs = await prisma.drug.findMany(query);

        if (!drugs) return false;
        return drugs;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function readDrug(query: Prisma.DrugWhereUniqueInput) {
    try {
        const drug = await prisma.drug.findUnique({ where: query });
        if (!drug) throw parentError(404, "Account Data Not Found");
        return drug;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function modifyDrug(query: Prisma.DrugWhereUniqueInput, update: CreateDrugInput["body"]) {
    try {
        const drug = await prisma.drug.update({
            where: query,
            data: update
        });
        if (!drug) throw parentError(404, "Account Data Not Found");
        return drug;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function disableDrug(query: Prisma.DrugWhereUniqueInput) {
    try {
        const drug = await prisma.drug.update({
            where: query,
            data: { removed: true }
        });
        if (!drug) throw parentError(404, "Account Data Not Found");
        return drug;
    } catch (error: any) {
        throw parentError(400, error);
    }
}
