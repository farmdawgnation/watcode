# Other routes
exports.view = require("./view").view
exports.compose = require("./compose").compose
exports.submit = require("./submit").submit
exports.category = require("./category").category

# Mongoose
mongoose = require "mongoose"

# GET / - Homepage
exports.index = (req, res) ->
  Submission = mongoose.model("Submission")
  results = Submission.find {published: true}, (err, docs) ->
    data = {
      as: global,
      success: req.flash("success"),
      error: req.flash("error"),
      submission: docs
    }
  
    res.render 'index', data
