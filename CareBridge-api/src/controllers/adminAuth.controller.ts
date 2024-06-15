import { NextFunction, Request, Response } from "express";

import { createSession } from "../services/session.service";

import { parentError } from "../functions/error";
import { signJwt } from "../functions/jwt.function";
import config from "../config/config";
import { CreateAdminInput, loginAdminInput } from "../schema/adminAuth.schema";
import { createAdmin, validatePassword } from "../services/adminAuth.service";
import { generateAccessToken } from "../functions/token.gen";
import logger from "../library/logger";

const NAMESPACE = "Administrator Authentication";

/** REGISTER ADMIN */
export async function register_admin(req: Request<{}, {}, CreateAdminInput["body"]>, res: Response, next: NextFunction) {
    try {
        const response = await createAdmin(req.body);
        return res.status(201).json(response);
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
}

/**  LOGIN FOR SUPER ADMIN AND SUB-ADMIN  */
export async function login_admin(req: Request<{}, {}, loginAdminInput["body"]>, res: Response, next: NextFunction) {
    try {
        const admin = await validatePassword(req.body);
        if (!admin) {
            throw parentError(401, "Invalid email or password");
        }

        const session = { adminId: admin.id, userAgent: req.get("user-agent") || "" };

        const accessToken = generateAccessToken(admin);
        const refreshToken = generateAccessToken(admin);
        // const session = await createSession({ administratorId: admin.id, userAgent: req.get("user-agent") || "" });

        // const accessToken = signJwt(
        //     { ...admin, session: session.administratorId },
        //     "serverAccessTokenPrivateKey",
        //     { expiresIn: config.server.token.serverAccessTokenTTL } // 15 minutes,
        // );

        // const refreshToken = signJwt(
        //     { ...admin, session: session.administratorId },
        //     "serverRefreshTokenPrivateKey",
        //     { expiresIn: config.server.token.serverRefreshTokenTTL } // 15 minutes
        // );

        return res.status(200).json({ succcess: true, admin, session, accessToken, refreshToken });
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
}

/** LOGOUT ADMIN */
export const logout_admin = async (req: Request, res: Response, next: NextFunction) => {
    try {
        // On client, also delete the accessToken

        //     const cookies = req.cookies;
        //     if (!cookies?.vamos) return res.status(204).json("No content");
        //     const refreshToken = cookies.vamos;

        //     const user = await User.findOne({ refreshToken }).exec();
        //     if (!user) {
        //         res.clearCookie("vamos", {
        //             httpOnly: true,
        //             secure: true,
        //             sameSite: "None"
        //         });
        //         return res.status(204).json("No content");
        //     }

        //     user.refreshToken = "";
        //     await user.save();

        //     res.clearCookie("vamos", {
        //         httpOnly: true,
        //         secure: true,
        //         sameSite: "None"
        //     });
        res.status(200).json({ message: "Logout was successful" });
    } catch (error: any) {
        logger.error(NAMESPACE, error.message, error);
        next(error);
    }
};
