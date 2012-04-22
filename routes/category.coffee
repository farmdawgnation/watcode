# Mongoose
mongoose = require "mongoose"

# GET / - Category listing
exports.category = (req, res) ->
  limit = 20
  skip = (req.params.page || 0)*limit
  Submission = mongoose.model("Submission")

  Submission.count {published: true, category: req.params.category}, (err, count) ->
    newerEnabled = skip > 0
    olderEnabled = count > skip + limit + 1

    Submission.where('published', true).where('category', req.params.category).sort('_id', -1).skip(skip).limit(limit).exec (err, docs) ->
      data = {
        as: global,
        success: req.flash("success"),
        error: req.flash("error"),
        currentUser: req.session.user,
        submission: docs,
        pagination: {
          newerEnabled: newerEnabled,
          newerLink: "/category/" + req.params.category + "/page/" + (req.params.page - 1),
          olderEnabled: olderEnabled,
          olderLink: "/category/" + req.params.category + "/page/" + (req.params.page + 1)
        }
      }

      res.render 'index', data
