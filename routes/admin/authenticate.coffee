# Mongoose
mongoose = require 'mongoose'

# POST /admin/authenticate - Authenticate an admin user
exports.authenticate = (req, res) ->
  User = mongoose.model "User"
  username = req.body.username || ""
  password = req.body.password || ""

  User.where('username', username).where('password', User.encryptPassword(password)).exec (err, docs) ->
    if (docs.length)
      req.session.user = docs[0]
      res.redirect("/admin/dashboard")
    else
      req.flash('error', "Invalid username or password.")
      res.redirect("back")
