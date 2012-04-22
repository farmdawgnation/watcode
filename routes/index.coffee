# Other routes
exports.view = require("./view").view
exports.compose = require("./compose").compose
exports.submit = require("./submit").submit
exports.language = require("./language").language
exports.category = require("./category").category

# Mongoose
mongoose = require "mongoose"

# GET / - Homepage
exports.index = (req, res) ->
  limit = 20
  skip = (req.params.page || 0)*limit
  Submission = mongoose.model("Submission")

  Submission.count {published: true}, (err, count) ->
    newerEnabled = skip > 0
    olderEnabled = count > skip + limit + 1

    Submission.where('published', true).sort('_id', -1).skip(skip).limit(limit).exec (err, docs) ->
      data = {
        as: global,
        success: req.flash("success"),
        error: req.flash("error"),
        currentUser: req.session.user,
        submission: docs,
        pagination: {
          newerEnabled: newerEnabled,
          newerLink: "/page/" + (req.params.page - 1),
          olderEnabled: olderEnabled,
          olderLink: "/page/" + (req.params.page + 1)
        }
      }

      res.render 'index', data
