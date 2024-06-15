import { object, string, TypeOf, date, z, number } from "zod";

const PaymentMode = z.enum(["CREDIT_CARD", "PAYPAL", "MOBILE_MONEY", "CASH"]);
const PaymentStatus = z.enum(["FAILED", "SUCCESSFUL"]);

const payload = {
    body: object({
        amount: number({ required_error: "Amount paid is required" }),
        paymentStatus: PaymentStatus,
        paymentMode: PaymentMode,
        paidOn: date({ required_error: "payment date is required" })
    })
};

const params = {
    params: object({
        paymentId: string({ required_error: "validation error - paymentId is required" })
    })
};

export const createPaymentSchema = object({
    ...payload
});
export const updatePaymentSchema = object({
    ...payload,
    ...params
});

export const deletePaymentSchema = object({
    ...params
});

export const getPaymentSchema = object({
    ...params
});

export type CreatePaymentInput = TypeOf<typeof createPaymentSchema>;
export type UpdatePaymentInput = TypeOf<typeof updatePaymentSchema>;
export type ReadPaymentInput = TypeOf<typeof getPaymentSchema>;
export type DeletePaymentInput = TypeOf<typeof deletePaymentSchema>;
