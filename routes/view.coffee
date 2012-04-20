mongoose = require "mongoose"

# GET /view/[id] - View a particular item.
exports.view = (req, res) ->
  Submission = mongoose.model("Submission")
  
  Submission.find {_id: req.params.id, published: true}, (err, docs) ->
    if (! docs.length)
      res.send("That item does not appear to exist.", 404)
      return;

    data = {
      as: global,
      submission: docs
    }

    res.render 'view', data


