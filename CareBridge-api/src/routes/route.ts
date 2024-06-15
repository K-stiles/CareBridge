import { Express, Request, Response, NextFunction } from "express";
import swaggerUI from "swagger-ui-express";

/**
 * MIDDLEWARE
 *
 *  */

// import deserializeEntity from "../middleware/deserialize.entity";
// import checkPatient from "..";

/**
 * ROUTES
 *
 * */
import { specs } from "../docs/swagger";
import { errorBuilder } from "../functions/error.builder";
import authRoute from "./auth.route";
import adminRoute from "./admin.route";
import patientsRoute from "./patient.route";
import doctorsRoute from "./doctor.route";
import appointmentRoute from "./appointment.route";
import serviceRoute from "./service.route";
import medicalinfoRoute from "./medicalinfo.route";
import prescriptionRoute from "./prescription.route";
import specializationRoute from "./specialization.route";
import drugRoute from "./drug.route";
import paymentRoute from "./payment.route";
import { notInScope } from "./notInScope";

export default function routeHandlers(app: Express) {
    /**
     * Server API Documentation
     *
     *  */
    app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(specs));

    /**
     * Health Check
     *
     * */
    app.get("/ping", (req: Request, res: Response, next: NextFunction) => {
        return res.status(200).json({ message: "pong" });
    });

    /**
     * APP ROUTES
     *
     */
    app.use("/api/v1/auth", authRoute);
    // app.use(deserializeEntity);
    app.use("/api/v1/admin", adminRoute);
    app.use("/api/v1/patients", patientsRoute);
    app.use("/api/v1/doctors", doctorsRoute);
    app.use("/api/v1/appointments", appointmentRoute);
    app.use("/api/v1/services", serviceRoute);
    app.use("/api/v1/specializations", specializationRoute);
    app.use("/api/v1/medicalinfo", medicalinfoRoute);
    app.use("/api/v1/prescriptions", prescriptionRoute);
    app.use("/api/v1/drugs", drugRoute);
    app.use("/api/v1/payment", paymentRoute);
    app.all("*", notInScope);
    app.use(errorBuilder);
}
