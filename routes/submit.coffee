mongoose = require "mongoose"

# POST /submit - Submit a new WAT
exports.submit = (req, res) ->
  validSubmission = true
  for key, value of req.body.submission
    validSubmission = validSubmission && value.toString().length

  if (! validSubmission)
    req.flash('error', "Please fill out all required fields.")
    res.redirect("/compose")
    return

  Submission = mongoose.model("Submission")
  
  newsub = new Submission(req.body.submission)
  newsub.language = newsub.languageName.toLowerCase()
  newsub.authorUrl = "http://twitter.com/" + newsub.author.toLowerCase()
  newsub.save()
  
  req.flash('success', "Your submission has been completed.")
  res.redirect("/")
