# GET /logout - Undo session
exports.logout = (req,res) ->
  req.session.user = undefined
  res.redirect("/")
