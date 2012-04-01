# POST /submit - Submit a new WAT
exports.submit = (req, res) ->
  console.log(req.body.submission)
  req.flash('success', "Your submission has been completed.")
  res.redirect("/compose")
