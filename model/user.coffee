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
