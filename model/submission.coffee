# Copyright 2012 Matt Farmer
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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
