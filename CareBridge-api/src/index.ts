import express, { Express } from "express";
import http from "http";
import cookieParser from "cookie-parser";
import cors from "cors";
import helmet from "helmet";

import logger from "./library/logger";
import config from "./config/config";
import routeHandlers from "./routes/route";
import useListener from "./middleware/useListener";
import useHead from "./middleware/useHead";

const NAMESPACE = "Server";
const app: Express = express();

/** Routeware */
app.use(useListener(NAMESPACE));
app.use(cors()); /** TODO:CONFIGURE CORS PROPERLY */
app.use(helmet());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(useHead);
routeHandlers(app);
/** Routes @routes/route */

const httpServer = http.createServer(app);
httpServer.listen(config.server.port, () => logger.info(NAMESPACE, `🚗💨 Server is running on http://${config.server.hostname}:${config.server.port}.`));
