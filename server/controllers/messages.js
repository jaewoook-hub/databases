var models = require('../models');

module.exports = {
  get: function (req, res) {
    models.messages.getAll((results) => {
      res.writeHead(200);
      res.write(results);
      res.end();

      // res.send()
    });
  }, // a function which handles a get request for all messages
  post: function (req, res) {
    // console.log('<--------------------------->)',
    var username = req.body.username;
    var message = req.body.message;
    var roomname = req.body.roomname;
    models.messages.create(username, message, roomname);
    res.end();
  }
};


