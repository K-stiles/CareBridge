import config from "../config/config";
import jwt, { JwtPayload } from "jsonwebtoken";
export type VerifiedJwtToken = {
    valid: boolean;
    expired: boolean;
    decoded: string | null | JwtPayload
};

export function signJwt(object: Object, keyName: "serverAccessTokenPrivateKey" | "serverRefreshTokenPrivateKey", options?: jwt.SignOptions | undefined) {
    const _privateSigningKey = config.server.token[keyName];

    return jwt.sign(object, _privateSigningKey, {
        ...(options && options),
        algorithm: "RS256"
    });
}

export function verifyJwt(token: string, keyName: "serverAccessTokenPublicKey" | "serverRefreshTokenPublicKey") {
    // const publicKey = Buffer.from(config.server.token[keyName], "base64").toString("ascii");
    // using same key as that for generateAccessToken for now
    const publicKey = config.server.token.secret;
    try {
        const decoded: JwtPayload | string = jwt.verify(token, publicKey);
        return {
            valid: true,
            expired: false,
            decoded
        };
    } catch (e: any) {
        // LOG THE ERROR
        console.error(e);
        // RETURN EXPIRED TOKEN
        return {
            valid: false,
            expired: e.message === "jwt expired",
            decoded: null
        };
    }
}
