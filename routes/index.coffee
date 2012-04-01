# Other routes
exports.view = require("./view").view
exports.compose = require("./compose").compose
exports.submit = require("./submit").submit

# Mongoose
mongoose = require "mongoose"

# GET / - Homepage
exports.index = (req, res) ->
  Submission = mongoose.model("Submission")
  results = Submission.find {}, (err, docs) ->
    console.log docs
    
    data = {
      as: global,
      success: req.flash("success"),
      error: req.flash("error"),
      submission: docs
    }
  
    res.render 'index', data
