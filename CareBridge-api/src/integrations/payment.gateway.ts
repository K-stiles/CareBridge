import axios from "axios";
import config from "../config/config";

export interface PaymentGateway {
    // initialize(): void;
    processPaymentRequest(chargeType: PaymentChargeTypes): Promise<PaymentGatewayRequest>;
    processPaymentResponse(chargeType: PaymentChargeTypes): Promise<PaymentGatewayResponse>;

    processMomoPayment(chargeType: PaymentChargeTypes): Promise<PaymentGatewayRequest>;
    getPaymentStatus(chargeType: PaymentChargeTypes): Promise<PaymentGatewayResponse>;
}

export enum currency {
    GHS = "GHS"
}

export interface PaymentGatewayRequest {}
export interface PaymentGatewayResponse {}

export interface PaymentRequest extends PaymentGatewayRequest {
    app_id: string;
    app_key: string;
    name?: string;
    mobile?: string;
    email?: string;
    order_id: string | number;
    currency: currency;
    amount: number;
    order_desc: string;
    merClientAcct: string;
    return_url: string;
}
export type PaymentRequestInput = Omit<PaymentRequest, "app_id" & "app_key">;

export interface PaymentResponse extends PaymentGatewayResponse {
    status_code: number;
    status_message: string;
    trans_ref_no: string;
    redirect_url: string;
}

export enum PaymentChargeTypes {
    MOMO = "MOMO",
    CARD = "CARD",
    INSURANCE = "INSURANCE"
}

export enum PaymentGatewayTypes {
    EMERGENT = "EMERGENT",
    OTHER = "OTHER"
}

export class EmergentPayment implements PaymentGateway {
    public async processPaymentRequest(chargeType: PaymentChargeTypes): Promise<PaymentGatewayResponse> {
        return {} as any as PaymentGatewayResponse;
    }
    public async processPaymentResponse(chargeType: PaymentChargeTypes): Promise<PaymentGatewayResponse> {
        return {} as any as PaymentGatewayResponse;
    }

    public async processMomoPayment(chargeType: PaymentChargeTypes): Promise<PaymentGatewayResponse> {
        return {} as any as PaymentGatewayResponse;
    }
    public async getPaymentStatus(chargeType: PaymentChargeTypes): Promise<PaymentGatewayResponse> {
        return {} as any as PaymentGatewayResponse;
    }
}
