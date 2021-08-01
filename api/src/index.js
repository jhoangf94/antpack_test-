const startServer = require("./app");
const connectDatabase = require("./database/database");

async function start() {
  try {
    // try to connect db and insert mock data
    const db = await connectDatabase();
    // start app
    startServer(db);
  } catch (error) {
    console.error(error);
    // stop process
    process.exit(1);
  }
}

start();
