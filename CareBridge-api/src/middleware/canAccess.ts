import { parentError } from "../functions/error";
import { Request, Response, NextFunction } from "express";
import { verifyJwt, VerifiedJwtToken } from "../functions/jwt.function";
import config from "../config/config";


export default (permission: string) => async (req: Request, res: Response, next: NextFunction) => {
    try {
        // need to check the permissions assigned to each userRole
        const bearerToken = req.headers?.authorization?.split(" ")[1] || req.headers?.authorization || "";

        const jwtToken: VerifiedJwtToken = verifyJwt(bearerToken, "serverAccessTokenPublicKey");

        if (!jwtToken.decoded || typeof jwtToken.decoded === 'string') throw parentError(401, "Authorization Failed");
        const userRole: string = jwtToken.decoded?.data?.roles[0];
        const hasPermission = config.server.rolesPermissions[userRole].find((_permission: string) => _permission === permission);
        if (!hasPermission) throw parentError(401, `You do not have the authorization to access this: ${permission}`);
        next();
    } catch (e: any) {
        console.error(e);
        next(e);
    }
};
