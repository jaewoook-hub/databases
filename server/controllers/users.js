var models = require('../models');

module.exports = {
  get: function (req, res) {
    models.users.getAll((results) => {
      res.writeHead(200);
      res.write(results);
      res.end();
    });
  },

  post: function (req, res) {
    var username = req.body.username;
    console.log(`----------${username}------------`);
    models.users.create(username);
    res.end();
  }
};
