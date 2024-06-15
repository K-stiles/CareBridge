import { get, omit } from "lodash";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import { Prisma } from "@prisma/client";
import { CreateDoctorInput } from "../schema/auth.schema";

type DoctorQuery = {
    where?: Prisma.DoctorWhereInput;
    orderBy?: Prisma.DoctorOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

export async function readallDoctors(query: DoctorQuery) {
    try {
        const doctors = await prisma.doctor.findMany({
            ...query //include: { service: { select: { name: true } } }
        });

        if (!doctors) return false;
        /**
         * TODO: LOOP THROUGH AND TAKE OUT PRN FIELD
         * */

        const totalDoctors = await prisma.doctor.count({ where: query.where });

        // return { doctors, totalDoctors };
        return doctors;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function readDoctor(query: Prisma.DoctorWhereUniqueInput) {
    try {
        const doctor = await prisma.doctor.findUnique({
            where: query //include: { service: { select: { name: true } } }
        });
        if (!doctor) throw parentError(404, "Account Data Not Found");
        return omit(doctor, "prn");
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function modifyDoctor(query: Prisma.DoctorWhereUniqueInput, update: CreateDoctorInput["body"]) {
    try {
        const doctor = await prisma.doctor.update({
            where: query,
            data: { ...update }
        });
        if (!doctor) throw parentError(404, "Account Data Not Found");
        return omit(doctor, "prn");
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function disableDoctor(query: Prisma.DoctorWhereUniqueInput) {
    try {
        const doctor = await prisma.doctor.update({
            where: query,
            data: { disabled: true }
        });
        if (!doctor) throw parentError(404, "Account Data Not Found");
        return omit(doctor, "prn");
    } catch (error: any) {
        throw parentError(400, error);
    }
}
