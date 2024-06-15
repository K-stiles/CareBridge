import { get } from "lodash";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import { Prisma } from "@prisma/client";
import { CreateManyServicesInput, CreateServiceInput } from "../schema/service.schema";

type ServiceQuery = {
    where?: Prisma.ServiceWhereInput;
    orderBy?: Prisma.ServiceOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

export async function createService(data: CreateServiceInput["body"]) {
    return await prisma.service.create({ data, include: { doctors: true } });
}
export async function createManyServices(data: CreateManyServicesInput["body"]) {
    return await prisma.service.createMany({ data });
}

export async function readallServices(query: ServiceQuery) {
    try {
        const services = await prisma.service.findMany({
            ...query,
            include: { doctors: { select: { id: true, fullname: true } } }
        });

        if (!services) return false;
        return services;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function readService(query: Prisma.ServiceWhereUniqueInput) {
    try {
        const service = await prisma.service.findFirst({
            where: query,
            include: {
                doctors: true
            }
        });
        if (!service) throw parentError(404, "Account Data Not Found");
        return service;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function modifyService(query: Prisma.ServiceWhereUniqueInput, update: CreateServiceInput["body"]) {
    try {
        const service = await prisma.service.update({
            where: query,
            data: update
        });
        if (!service) throw parentError(404, "Account Data Not Found");
        return service;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function disableService(query: Prisma.ServiceWhereUniqueInput) {
    try {
        const service = await prisma.service.update({
            where: query,
            data: { removed: true }
        });
        if (!service) throw parentError(404, "Account Data Not Found");
        return service;
    } catch (error: any) {
        throw parentError(400, error);
    }
}
