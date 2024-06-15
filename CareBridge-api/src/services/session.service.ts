import { Prisma } from "@prisma/client";
import prisma from "../db/db";
import { get } from "lodash";
import config from "../config/config";
import { findPatient } from "./auth.service";
import { signJwt, verifyJwt } from "../functions/jwt.function";

type SessionQuery = {
    where?: Prisma.SessionWhereInput;
    orderBy?: Prisma.SessionOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

type Session = {
    patientId?: string;
    doctorId?: string;
    administratorId?: string;
    userAgent: string;
    valid?: boolean;
};

export async function createSession(data: Session) {
    return await prisma.session.create({ data });
}

export async function findSessions(query: SessionQuery) {
    return await prisma.session.findMany(query);
}

export async function updateSession(query: Prisma.SessionWhereUniqueInput, update: Session) {
    return await prisma.session.update({
        where: query,
        data: update
    });
}

interface REFRESH_TOKEN {
    refreshToken: string;
}

export async function reIssueAccessToken({ refreshToken }: REFRESH_TOKEN) {
    const { decoded } = verifyJwt(refreshToken, "serverRefreshTokenPublicKey");

    if (!decoded || !get(decoded, "session")) return false;

    /**
     * FIND THE SESSION BY ID [findById(get(decoded, "session"))]
     * BELOW IS DUMMY
     */
    const session = { valid: true, patient: "", patientId: "" };

    if (!session || !session.valid) return false;

    const patient = await findPatient({ id: session.patientId });

    if (!patient) return false;

    const accessToken = signJwt({ ...patient, session: session.patientId }, "serverAccessTokenPrivateKey", { expiresIn: config.server.token.serverAccessTokenTTL });

    return accessToken;
}
