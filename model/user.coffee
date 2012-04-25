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
crypto = require 'crypto'
mongoose = require "mongoose"
Schema = mongoose.Schema

User = new Schema({
  username: {type: String, lowercase: true},
  password: String
})

User.statics.encryptPassword = (plaintextPassword) ->
  sha512hash = crypto.createHash('sha512')
  sha512hash.update plaintextPassword
  sha512hash.digest 'hex'

UserSession = new Schema({
  username: {type: String, lowercase: true},
  ip: String,
  loggedInAt: Date,
  loggedOutAt: Date
})

mongoose.model('User', User)
mongoose.model('UserSession', UserSession)
