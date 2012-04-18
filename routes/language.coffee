# Mongoose
mongoose = require "mongoose"

# GET / - Homepage
exports.language = (req, res) ->
  limit = 20
  skip = (req.params.page || 0)*limit

  Submission = mongoose.model("Submission")
  results = Submission.where('published', true).where('language', req.params.language).skip(skip).limit(limit).exec (err, docs) ->
    data = {
      as: global,
      success: req.flash("success"),
      error: req.flash("error"),
      submission: docs
    }
  
    res.render 'index', data
