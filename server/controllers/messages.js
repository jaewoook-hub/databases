var models = require('../models');

module.exports = {
  get: function (req, res) {

  }, // a function which handles a get request for all messages
  post: function (req, res) {
    request({
      method: 'POST',
      uri: 'http://127.0.0.1:3000/classes/messages',
      json: {
        username: 'Valjean',
        message: 'In mercy\'s name, three days is all I need.',
        roomname: 'Hello'
      }
  } // a function which handles posting a message to the database
};
