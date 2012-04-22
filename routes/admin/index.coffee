# Sub-routes of admin
exports.login = require("./login").login
exports.authenticate = require("./authenticate").authenticate
exports.logout = require("./logout").logout
exports.dashboard = require("./dashboard").dashboard
exports.publish = require("./publish").publish
exports.delete = require("./delete").delete

# GET /admin
# If logged in, then redirect to the dashboard. If not logged in
# redirect to login page.
exports.index = (req, res) ->
  # TODO
