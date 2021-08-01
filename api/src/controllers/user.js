const { USERS_COLLECTION } = require("../database/collectionsName");

const getUsers = (db) => async (req, res) => {
  const userCollection = db.collection(USERS_COLLECTION);
  const allUsers = await userCollection.find({}).toArray();

  res.send(allUsers);
};

function usersController(db) {
  return {
    getUsers: getUsers(db),
  };
}

module.exports = usersController;
