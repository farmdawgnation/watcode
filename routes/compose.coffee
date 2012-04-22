# GET /compose - Compose a new submission
exports.compose = (req, res) ->
  data = {
    success: req.flash("success"),
    error: req.flash("error"),
    currentUser: req.session.user,
    recaptchakey: process.env.RECAPTCHAKEY
  }

  res.render 'compose', data

