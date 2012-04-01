mongoose = require "mongoose"

# POST /submit - Submit a new WAT
exports.submit = (req, res) ->
  Submission = mongoose.model("Submission")
  
  newsub = new Submission(req.body.submission)
  newsub.language = newsub.languageName.toLowerCase()
  newsub.save()
  
  req.flash('success', "Your submission has been completed.")
  res.redirect("/")
