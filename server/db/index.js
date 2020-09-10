var mysql = require('mysql');

// Create a database connection and export it from this file.
// You will need to connect with the user "root", no password,
// and to the database "chat".


var db = mysql.createConnection({
  user: 'root',
  password: 'foursqare',
  database: 'chat'
});

db.connect();

db.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
  if (error) {
    throw error;
  }
  console.log('The solution is: ', results[0].solution);
});

db.end();

module.exports.db = db;