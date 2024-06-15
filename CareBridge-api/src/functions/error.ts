import { Response } from "express";

export const parentError = (status: number, message: string) => {
    const error: any = new Error();
    error.status = status;
    error.message = message;
    return error;
};

export const sendErrorResponse = (res: Response, code: number, errorMessage: string, e: any = null) =>
    res.status(code).send({
        status: "error",
        error: errorMessage,
        e: e?.toString()
    });
