# Mongoose
mongoose = require "mongoose"

# GET / - Homepage
exports.category = (req, res) ->
  Submission = mongoose.model("Submission")
  results = Submission.find {language: req.params.category, published: true}, (err, docs) ->
    data = {
      as: global,
      success: req.flash("success"),
      error: req.flash("error"),
      submission: docs
    }
  
    res.render 'index', data
