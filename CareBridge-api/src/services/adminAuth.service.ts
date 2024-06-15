import { omit } from "lodash";
import bcrypt from "bcryptjs";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import config from "../config/config";
import { CreateAdminInput, loginAdminInput } from "../schema/adminAuth.schema";
// import prisma from "@/db/db";

const NAMESPACE = "Admin/Doctor";

export async function createAdmin(input: CreateAdminInput["body"]) {
    try {
        const _exists = await prisma.administrator.findUnique({ where: { email: input.email } });
        if (_exists) throw parentError(409, "Admin account already exists.");

        /** HASH THE PASSWORD */
        const saltSync = bcrypt.genSaltSync(config.server.saltWorkFactor);
        const password = bcrypt.hashSync(input.password, saltSync);

        const admin = await prisma.administrator.create({ data: { ...input, password } });
        return omit(admin, "password");
    } catch (e: any) {
        throw new Error(e);
    }
}

export async function validatePassword(input: loginAdminInput["body"]) {
    const admin = await prisma.administrator.findUnique({ where: { email: input.email } });
    if (!admin) throw parentError(400, "Invalid email or password");

    /** BECRYPT PASSWORD COMPARISON */
    const isValid = await bcrypt.compare(input.password, admin.password);
    if (!isValid) throw parentError(400, "Please check your Credentials and try again");
    return omit(admin, "password");
}
