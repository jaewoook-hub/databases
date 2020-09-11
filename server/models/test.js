db.db.query(userId, function(error, results) {
  if (error) {
    throw error;
  }
  var newUserId = results[0].id;

});


get = function(req, res) {

};