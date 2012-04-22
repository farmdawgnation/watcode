# Mongoose
mongoose = require "mongoose"

# GET /admin/dashboard - Render dashboard
exports.dashboard = (req, res) ->
  Submission = mongoose.model("Submission")

  if (! req.session.user)
    res.flash.error = "Authentication is required to access this area."
    res.redirect("/admin/login")

  # Retrieve unpublished submissions
  Submission.where('published', false).exec (err, docs) ->
    data = {
      as: global,
      success: req.flash("success"),
      error: req.flash("error"),
      submission: docs,
      currentUser: req.session.user
    }

    res.render 'admin/dashboard', data
