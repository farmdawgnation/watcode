# GET /admin/login - Show the login form
exports.login = (req, res) ->
  res.render "admin/login", {error: req.flash('error')}
