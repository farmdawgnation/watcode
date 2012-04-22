# Mongoose
mongoose = require "mongoose"

# POST /admin/publish - Publish a submission
exports.publish = (req, res) ->
  Submission = mongoose.model("Submission")

  if (! req.session.user)
    req.flash.error = "Authentication is required to access this area."
    req.redirect("/admin/login")

  if (! req.body.submissionId)
    res.send "Submission ID is not specified.", 422

  Submission.update {_id: req.body.submissionId}, {'$set': {published: true}}, [], (err, docs) ->
    res.send 200
