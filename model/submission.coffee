mongoose = require "mongoose"
Schema = mongoose.Schema

Submission = new Schema (
  title: String,
  summary: String,
  language: String,
  languageName: String,
  author: String,
  authorUrl: String,
  code: String
)

mongoose.model("Submission", Submission)
