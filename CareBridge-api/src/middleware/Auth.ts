import { parentError } from "../functions/error";
import { Request, Response, NextFunction } from "express";
import { verifyJwt, VerifiedJwtToken } from "../functions/jwt.function";

export default async (req: Request, res: Response, next: NextFunction) => {
    try {
        if (!req.headers.authorization) {
            throw parentError(401, "Authentication required");
        }

        const bearerToken = req.headers.authorization.split(" ")[1] || req.headers.authorization;

        const jwtToken: VerifiedJwtToken = verifyJwt(bearerToken, "serverAccessTokenPublicKey");

        if (!jwtToken.valid) throw parentError(401, "Authentication Failed");
        if (jwtToken.expired) throw parentError(401, "Authentication token expired, please login again.");
        if (!jwtToken.decoded) throw parentError(401, "Authentication Failed");

        next();
    } catch (e: any) {
        console.error(e);
        next(e);
    }
};
