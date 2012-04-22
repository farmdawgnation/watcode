mongoose = require "mongoose"
Schema = mongoose.Schema

Submission = new Schema({
  title: String,
  summary: String,
  category: String,
  language: String,
  languageName: String,
  author: String,
  authorUrl: String,
  authorEmail: String,
  code: String,
  published: {type: Boolean, default: false}
}, {strict: true})

mongoose.model("Submission", Submission)
