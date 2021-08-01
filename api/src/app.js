const express = require("express");
const userRoutes = require("./routes/user");
const userController = require("./controllers/user");

const app = express();
const port = 3000;

// when call main route redirect to /users
app.get("/", (_, res) => res.redirect("/users"));

function startServer(db) {
  userRoutes(app, userController(db));

  app.listen(port, () => {
    console.info(`Server runing on port ${port}`);
  });
}

module.exports = startServer;
