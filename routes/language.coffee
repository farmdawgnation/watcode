# Mongoose
mongoose = require "mongoose"

# GET / - Homepage
exports.language = (req, res) ->
  Submission = mongoose.model("Submission")
  results = Submission.find {language: req.params.language, published: true}, (err, docs) ->
    data = {
      as: global,
      success: req.flash("success"),
      error: req.flash("error"),
      submission: docs
    }
  
    res.render 'index', data
