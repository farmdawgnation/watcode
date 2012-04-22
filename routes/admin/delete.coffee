# Mongoose
mongoose = require "mongoose"

# POST /admin/delete - Delete a submission
exports.delete = (req, res) ->
  Submission = mongoose.model("Submission")

  if (! req.session.user)
    req.flash.error = "Authentication is required to access this."
    req.redirect("/admin/login")

  if (! req.body.submissionId)
    res.send "Submission ID is not specified.", 422

  # Remove submission
  Submission.where('_id', req.body.submissionId).remove (err, docs) ->
    res.send 200
