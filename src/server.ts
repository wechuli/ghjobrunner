import app from "./app";

import { config } from "dotenv";

if (process.env.NODE_ENV !== "development") {
  // Load environment variables from .env file
  config();
}

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
