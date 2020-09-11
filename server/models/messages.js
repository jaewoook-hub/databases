var db = require('../db');
var _ = require('lodash');

module.exports = {
  getAll: function (callback) {
    var getMsgs = 'SELECT message FROM messages';
    db.db.query(getMsgs, function(error, results) {
      var resultArray = [];
      _.map(results, (result) => {
        resultArray.push(result.message);
      });
      callback(JSON.stringify(resultArray));
    });
  }, // a function which produces all the messages
  create: function (username, message, roomname) {
    var userId = 'SELECT id FROM users WHERE username = "' + username + '"';
    var roomId = 'SELECT id FROM rooms WHERE roomname = "' + roomname + '"';




    db.db.query(userId, function(error, results) {
      if (error) {
        throw error;
      }
      var newUserId = results[0].id;

      db.db.query(roomId, function(error, results) {
        if (error) {
          throw error;
        }

        var newRoomId = results[0].id;

        var sql = 'INSERT INTO messages(username, message, roomname) VALUES ("' + newUserId + '", "' + message + '", "' + newRoomId + '")';
        db.db.query(sql, function (error, results, fields) {

          console.log(message);
          if (error) {
            throw error;
          }
          db.db.end();
        });

      });

    });




    // debugger;
    // console.log(newUserId);
    // db.db.query(roomId, function(error, results) {
    //   if (error) {
    //     throw error;
    //   }
    //   roomId = results[0].id;
    // });
    // var sql = 'INSERT INTO messages(username, message, roomname) VALUES (SELECT id FROM users WHERE username = "' + username + '", "' + message + '", SELECT id FROM rooms WHERE roomname = "' + roomname + '")';

    // db.db.query(sql, function (error, results, fields) {
    //   if (error) {
    //     throw error;
    //   }
    // });
    // db.db.end();
  } // a function which can be used to insert a message into the database

};

// SELECT id FROM users WHERE username = "' + username + '"; SELECT id FROM rooms WHERE roomname = "' + roomname + '";