# Mongoose
mongoose = require 'mongoose'

# POST /admin/authenticate - Authenticate an admin user
exports.authenticate = (req, res) ->
  # FIXME: Implement actual authentication.
  username = req.body.username || ""
  password = req.body.password || ""

  User = mongoose.model "User"

  User.where('username', username).where('password', User.encryptPassword(password)).exec (err, docs) ->
    if (docs.length)
      req.session.user = docs[0]
      res.redirect("/admin/dashboard")
    else
      req.flash('error', "Invalid username or password.")
      res.redirect("back")
