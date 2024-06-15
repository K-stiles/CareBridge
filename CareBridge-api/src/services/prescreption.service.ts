import { get } from "lodash";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import { Prisma } from "@prisma/client";
import { CreatePrescriptionInput } from "../schema/prescription.schema";

type PrescriptionQuery = {
    where?: Prisma.PrescriptionWhereInput;
    orderBy?: Prisma.PrescriptionOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

export async function createPrescription(body: CreatePrescriptionInput["body"]) {
    return await prisma.prescription.create({
        data: {
            doctor: { connect: { id: body.doctorId } },
            patient: { connect: { id: body.patientId } },
            name: body.name,
            description: body.description,
            drugs: { connect: body.drugIds.map((drug) => ({ id: drug.id })) }
        },
        include: { drugs: { select: { id: true, name: true, dosage: true } } }
    });
    // return await prisma.prescription.create({ data });
}

export async function readallPrescriptions(query: PrescriptionQuery) {
    try {
        const prescriptions = await prisma.prescription.findMany(query);

        if (!prescriptions) return false;
        return prescriptions;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function readPrescription(query: Prisma.PrescriptionWhereUniqueInput) {
    try {
        const prescription = await prisma.prescription.findUnique({ where: query });
        if (!prescription) throw parentError(404, "Account Data Not Found");
        return prescription;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function modifyPrescription(query: Prisma.PrescriptionWhereUniqueInput, update: CreatePrescriptionInput["body"]) {
    try {
        const prescription = await prisma.prescription.update({
            where: query,
            data: update
        });
        if (!prescription) throw parentError(404, "Account Data Not Found");
        return prescription;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function disablePrescription(query: Prisma.PrescriptionWhereUniqueInput) {
    try {
        const prescription = await prisma.prescription.update({
            where: query,
            data: { removed: true }
        });
        if (!prescription) throw parentError(404, "Account Data Not Found");
        return prescription;
    } catch (error: any) {
        throw parentError(400, error);
    }
}
