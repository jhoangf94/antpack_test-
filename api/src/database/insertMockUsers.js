const users = require("./mockUsers");
const { USERS_COLLECTION } = require("./collectionsName");

async function insertMockUsers(db) {
  const usersCollection = db.collection(USERS_COLLECTION);
  const insertedUserts = await usersCollection.find({}).toArray();

  // if have inserted users not do again
  if (insertedUserts.length > 0) return;

  await usersCollection.insertMany(users);

  console.log("Inserted mock users");
}

module.exports = insertMockUsers;
