# GET /compose - Compose a new submission
exports.compose = (req, res) ->
  data = {
    success: req.flash("success")
  }
  
  res.render 'compose', data

