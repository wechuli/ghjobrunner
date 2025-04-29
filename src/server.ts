import express from "express";
import cors from "cors";
import helmet from "helmet";
import morgan from "morgan";
import compression from "compression";
import { config } from "dotenv";

if (process.env.NODE_ENV !== "development") {
  // Load environment variables from .env file
  config();
}
const app = express();

// middleware
app.use(cors());
app.use(helmet());
app.use(morgan("combined"));
app.use(compression());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
