import { get } from "lodash";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import { Prisma } from "@prisma/client";
import { CreateAdminInput } from "../schema/adminAuth.schema";

type AdministratorQuery = {
    where?: Prisma.AdministratorWhereInput;
    orderBy?: Prisma.AdministratorOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

export async function readallAdministrators(query: AdministratorQuery) {
    try {
        const administrators = await prisma.administrator.findMany(query);

        if (!administrators) return false;
        return administrators;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function readAdministrator(query: Prisma.AdministratorWhereUniqueInput) {
    try {
        const administrator = await prisma.administrator.findUnique({ where: query });
        if (!administrator) throw parentError(404, "Account Data Not Found");
        return administrator;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function modifyAdministrator(query: Prisma.AdministratorWhereUniqueInput, update: CreateAdminInput["body"]) {
    try {
        const administrator = await prisma.administrator.update({
            where: query,
            data: update
        });
        if (!administrator) throw parentError(404, "Account Data Not Found");
        return administrator;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function disableAdministrator(query: Prisma.AdministratorWhereUniqueInput) {
    try {
        const administrator = await prisma.administrator.update({
            where: query,
            data: { disabled: true }
        });
        if (!administrator) throw parentError(404, "Account Data Not Found");
        return administrator;
    } catch (error: any) {
        throw parentError(400, error);
    }
}
