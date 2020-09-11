var db = require('../db');
var _ = require('lodash');

module.exports = {
  getAll: function (callback) {
    var sql = 'SELECT username FROM users';
    db.db.query(sql, (error, results) => {
      var resultArray = [];
      _.map(results, (items) => {
        resultArray.push(items.username);
      });
      callback(JSON.stringify(resultArray));
    });
    db.db.end();
  },
  create: function (username) {
    var sql = 'INSERT INTO users(username) VALUES ("' + username + '")';
    db.db.query(sql, function (error, results, fields) {
      if (error) {
        throw error;
      }
    });
    db.db.end();
  }
};