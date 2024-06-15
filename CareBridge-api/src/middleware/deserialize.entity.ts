/** middleware */

import { get } from "lodash";
import { Request, Response, NextFunction } from "express";
import { verifyJwt } from "../functions/jwt.function";
import { reIssueAccessToken } from "../services/session.service";
import logger from "../library/logger";

const deserializeEntity = async (req: Request, res: Response, next: NextFunction) => {
    const accessToken = get(req, "headers.authorization", "").replace(/^Bearer\s/, "");

    console.log("accessToken===============================:\n ", accessToken);

    const refreshToken = get(req, "headers.x-refresh");

    if (!accessToken) {
        return next();
    }

    const { decoded, expired } = verifyJwt(accessToken, "serverAccessTokenPublicKey");

    if (decoded) {
        res.locals.user = decoded;
        console.log("decoded USER:--> ", decoded);
        logger.info("SERVER-MDDLEWARE", res.locals.user);
        return next();
    }

    // TODO: GENERATE A NEW ACCESS TOKEN TO USER
    // if (expired && refreshToken) {
    //     const newAccessToken = await reIssueAccessToken({ refreshToken });

    //     if (newAccessToken) {
    //         res.setHeader("x-access-token", newAccessToken);
    //     }

    //     const result = verifyJwt(newAccessToken as string, "serverAccessTokenPublicKey");

    //     res.locals.user = result.decoded;
    //     return next();
    // }

    return next();
};

export default deserializeEntity;
