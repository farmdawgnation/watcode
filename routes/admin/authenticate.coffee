# POST /admin/authenticate - Authenticate an admin user
exports.authenticate = (req, res) ->
  # FIXME: Implement actual authentication.
  username = req.body.username || ""
  password = req.body.password || ""

  if (username == "matt" && password == "bacon")
    req.session.user = {username: 'matt'}
    req.redirect("/admin/dashboard")
  else
    req.flash.error = "Invalid username or password."
    req.redirect("back")
