const { MongoClient } = require("mongodb");
const insertMockUsers = require("./insertMockUsers");

// Connection URI
const uri = "mongodb://database";

const dbName = "antpack_db";

// Create a new MongoClient
const client = new MongoClient(uri);

async function runDatabseConection() {
  // Connect the client to the server
  await client.connect();

  // Establish and verify connection
  const db = client.db(dbName);

  await db.command({ ping: 1 });

  console.log("Database connected");

  // insert mock data of users
  await insertMockUsers(db);

  return db;
}

module.exports = runDatabseConection;
