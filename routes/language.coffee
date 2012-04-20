# Mongoose
mongoose = require "mongoose"

# GET / - Homepage
exports.language = (req, res) ->
  limit = 20
  skip = (req.params.page || 0)*limit
  Submission = mongoose.model("Submission")
  
  Submission.count {published: true, language: req.params.language}, (err, count) ->
    newerEnabled = skip > 0
    olderEnabled = count > skip + limit + 1

    Submission.where('published', true).where('language', req.params.language).sort('_id', -1).skip(skip).limit(limit).exec (err, docs) ->
      data = {
        as: global,
        success: req.flash("success"),
        error: req.flash("error"),
        submission: docs,
        pagination: {
          newerEnabled: newerEnabled,
          newerLink: "/language/" + req.params.language + "/page/" + (req.params.page - 1),
          olderEnabled: olderEnabled,
          olderLink: "/language/" + req.params.language + "/page/" + (req.params.page + 1)
        }
      }

      res.render 'index', data
