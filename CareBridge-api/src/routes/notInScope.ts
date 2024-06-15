import { Request, Response, NextFunction } from "express";

export const notInScope = (req: Request, res: Response, next: NextFunction) => {
    res.status(200).json({ message: "PAGE NOT FOUND" });
};
