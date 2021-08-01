function userRoutes(app, controller) {
  app.get("/users", controller.getUsers);
}

module.exports = userRoutes;
