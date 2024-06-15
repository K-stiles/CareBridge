import jwt from "jsonwebtoken";

import config from "../config/config";

export function generateAccessToken(client: any) {
    const roles = [client.role];
    return jwt.sign(
        {
            data: {
                id: client.id,
                email: client.email,
                roles
            }
        },
        config.server.token.secret,
        { expiresIn: "10m" }
    );
}
