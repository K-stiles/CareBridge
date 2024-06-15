import { get } from "lodash";
import { parentError } from "../functions/error";
import prisma from "../db/db";
import { Prisma } from "@prisma/client";
import { CreatePaymentInput } from "../schema/payment.schema";

type PaymentQuery = {
    where?: Prisma.PaymentWhereInput;
    orderBy?: Prisma.PaymentOrderByWithRelationInput;
    skip?: number;
    take?: number;
};

export async function createPayment(data: CreatePaymentInput["body"]) {
    return await prisma.payment.create({ data });
}

export async function readallPayments(query: PaymentQuery) {
    try {
        const payments = await prisma.payment.findMany(query);

        if (!payments) return false;
        return payments;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function readPayment(query: Prisma.PaymentWhereUniqueInput) {
    try {
        const payment = await prisma.payment.findUnique({ where: query });
        if (!payment) throw parentError(404, "Account Data Not Found");
        return payment;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function modifyPayment(query: Prisma.PaymentWhereUniqueInput, update: CreatePaymentInput["body"]) {
    try {
        const payment = await prisma.payment.update({
            where: query,
            data: update
        });
        if (!payment) throw parentError(404, "Account Data Not Found");
        return payment;
    } catch (error: any) {
        throw parentError(400, error);
    }
}

export async function disablePayment(query: Prisma.PaymentWhereUniqueInput) {
    try {
        const payment = await prisma.payment.update({
            where: query,
            data: { removed: true }
        });
        if (!payment) throw parentError(404, "Account Data Not Found");
        return payment;
    } catch (error: any) {
        throw parentError(400, error);
    }
}
