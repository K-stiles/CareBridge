import dotenv from "dotenv";

dotenv.config();

const SERVER_HOSTNAME: string = process.env.SERVER_HOSTNAME || "??";
const SERVER_PORT: number = process.env.PORT ? Number(process.env.PORT) : 4000;
// const SERVER_PORT: number = process.env.SERVER_PORT ? Number(process.env.SERVER_PORT) : 4000;
const SERVER_ACCESS_TOKEN_TTL: string = process.env.SERVER_ACCESS_TOKEN_TTL ? process.env.SERVER_ACCESS_TOKEN_TTL : "??";
const SERVER_REFRESH_TOKEN_TTL: string = process.env.SERVER_REFRESH_TOKEN_TTL ? process.env.SERVER_REFRESH_TOKEN_TTL : "??";
const SERVER_TOKEN_ISSUER: string = process.env.SERVER_TOKEN_ISSUER || "??";
const ACCESS_TOKEN_SECRETE: string = process.env.ACCESS_TOKEN_SECRETE || "??";
const SERVER_ACCESS_TOKEN_PRIVATE_KEY: string = process.env.SERVER_ACCESS_TOKEN_PRIVATE_KEY || "??";
const SERVER_ACCESS_TOKEN_PUBLIC_KEY: string = process.env.SERVER_ACCESS_TOKEN_PUBLIC_KEY || "??";
const SERVER_REFRESH_TOKEN_PRIVATE_KEY: string = process.env.SERVER_REFRESH_TOKEN_PRIVATE_KEY || "??";
const SERVER_REFRESH_TOKEN_PUBLIC_KEY: string = process.env.SERVER_REFRESH_TOKEN_PUBLIC_KEY || "??";
const SALT_WORK_FACTOR: number = Number(process.env.SALT_WORK_FACTOR);
const EMEREGENT_INTERPAY_BASE_URL: string = process.env.EMEREGENT_INTERPAY_BASE_URL || "??";
const EMEREGENT_INTERPAY_MOMO_URL: string = process.env.EMEREGENT_INTERPAY_MOMO_URL || "??";
const EMEREGENT_INTERPAY_CARD_URL: string = process.env.EMEREGENT_INTERPAY_CARD_URL || "??";
const EMERGENT_INTERPAY_APP_ID: string = process.env.EMERGENT_INTERPAY_APP_ID || "??";
const EMERGENT_INTERPAY_APP_KEY: string = process.env.EMERGENT_INTERPAY_APP_KEY || "??";
const permissions: any = {
    ALL: "all",
    VIEW_DOCTOR: "view-doctor",
    UPDATE_DOCTOR: "update-doctor",
    DELETE_DOCTOR: "delete-doctor",
    CREATE_DOCTOR: "create-doctor",
    VIEW_PATIENT: "view-patient",
    UPDATE_PATIENT: "update-patient",
    DELETE_PATIENT: "delete-patient",
    CREATE_PATIENT: "create-patient"
};
const rolesPermissions: any = {
    PATIENT_200: [permissions.VIEW_DOCTOR],
    DOCTOR_600: [permissions.UPDATE_DOCTOR],
    ADMIN_1050: [permissions.ALL]
};
const integrations: any = {
    PAYMENT: {
        baseURL: EMEREGENT_INTERPAY_BASE_URL,
        appKey: EMERGENT_INTERPAY_APP_KEY,
        appId: EMERGENT_INTERPAY_APP_ID,
        paymentModeURL: {
            MOMO: EMEREGENT_INTERPAY_MOMO_URL,
            CARD: EMEREGENT_INTERPAY_CARD_URL
        }
    }
};
const SERVER = {
    hostname: SERVER_HOSTNAME,
    port: SERVER_PORT,
    saltWorkFactor: SALT_WORK_FACTOR,
    token: {
        serverAccessTokenTTL: SERVER_ACCESS_TOKEN_TTL,
        serverRefreshTokenTTL: SERVER_REFRESH_TOKEN_TTL,
        issuer: SERVER_TOKEN_ISSUER,
        secret: ACCESS_TOKEN_SECRETE,
        serverAccessTokenPrivateKey: SERVER_ACCESS_TOKEN_PRIVATE_KEY,
        serverRefreshTokenPrivateKey: SERVER_REFRESH_TOKEN_PRIVATE_KEY,
        serverAccessTokenPublicKey: SERVER_ACCESS_TOKEN_PUBLIC_KEY,
        serverRefreshTokenPublicKey: SERVER_REFRESH_TOKEN_PUBLIC_KEY
    },
    integrations,
    permissions,
    rolesPermissions
};

const config = { server: SERVER };

export default config;
