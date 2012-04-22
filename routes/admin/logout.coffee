# GET /logout - Undo session
exports.logout = (res,req) ->
  req.session.user = undefined
  req.redirect("/")
