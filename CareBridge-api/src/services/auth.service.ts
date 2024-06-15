import { omit } from "lodash";
import bcrypt from "bcryptjs";
import { parentError } from "../functions/error";
import { CreateDoctorInput, CreatePatientInput, loginDoctorInput, loginInput } from "../schema/auth.schema";
import prisma from "../db/db";
import config from "../config/config";
// import prisma from "@/db/db";

const NAMESPACE = "Patient/Doctor Authentication";

export async function createPatient(input: CreatePatientInput["body"]) {
    try {
        const _exists = await prisma.patient.findUnique({ where: { email: input.email } });
        if (_exists) throw parentError(409, "Patient already exists.");

        /** HASH THE PASSWORD */
        const saltSync = bcrypt.genSaltSync(config.server.saltWorkFactor);
        const password = bcrypt.hashSync(input.password, saltSync);

        const patient = await prisma.patient.create({ data: { ...input, password } });
        return omit(patient, "password");
    } catch (e: any) {
        throw new Error(e);
    }
}
export async function createDoctor(input: CreateDoctorInput["body"]) {
    try {
        const _exists = await prisma.doctor.findUnique({ where: { email: input.email } });
        if (_exists) throw parentError(409, "Doctor already exists.");

        /** HASH THE PRN */
        const saltSync = bcrypt.genSaltSync(config.server.saltWorkFactor);
        const prn = bcrypt.hashSync(input.prn, saltSync);

        const doctor = await prisma.doctor.create({ data: { ...input, prn } });
        return omit(doctor, "prn");
    } catch (e: any) {
        throw new Error(e);
    }
}

export async function verifyAuth(input: CreatePatientInput["body"]) {
    try {
        const _patient = await prisma.patient.findUnique({ where: { email: input.email } });
        if (_patient) throw parentError(404, "Patient Account Not Found");

        const patient = await prisma.patient.update({
            where: { email: input.email },
            data: { isVerified: true }
        });

        return omit(patient, "password");
    } catch (e: any) {
        throw new Error(e);
    }
}

export async function validatePassword(input: loginInput["body"]) {
    const patient = await prisma.patient.findUnique({ where: { email: input.email } });
    if (!patient) throw parentError(400, "Invalid email or password");

    /** BECRYPT PASSWORD COMPARISON */
    const isValid = await bcrypt.compare(input.password, patient.password);
    if (!isValid) throw parentError(400, "Please check your Credentials and try again");
    return omit(patient, "password");
}

export async function validatePRN(input: loginDoctorInput["body"]) {
    const doctor = await prisma.doctor.findUnique({ where: { email: input.email } });
    if (!doctor) throw parentError(400, "Invalid email or password");

    /** BECRYPT PASSWORD COMPARISON */
    const isValid = await bcrypt.compare(input.prn, doctor.prn);
    if (!isValid) throw parentError(400, "Please check your Credentials and try again");
    return omit(doctor, "prn");
}

/** reIssueAccessToken to find the patient  */
export async function findPatient(query: any) {
    return { email: "", password: "" };
}
