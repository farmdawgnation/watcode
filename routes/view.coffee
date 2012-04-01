mongoose = require "mongoose"

# GET /view/[id] - View a particular item.
exports.view = (req, res) ->
  Submission = mongoose.model("Submission")
  
  Submission.find {_id: req.params.id}, (err, docs) ->
    data = {
      as: global,
      submission: docs
    }
  
    res.render 'index', data


