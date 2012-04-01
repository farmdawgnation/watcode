# Other routes
exports.view = require("./view").view
exports.compose = require("./compose").compose
exports.submit = require("./submit").submit

# GET / - Homepage
exports.index = (req, res) ->
  data = {
    as: global,
    submission: [
      {
        title: "#102 Excellent CSS",
        summary: "This is an example of some weird stuff.",
        language: "css",
        languageName: "CSS",
        author: "@farmdawgnation",
        authorUrl: "http://twitter.com/farmdawgnation",
        code: "#container {\n\tdisplay: none\n\tzoom-level:1\n}"
      },
      {
        title: "#104 Excellent Javascript",
        summary: "I really hate Internet Explorer for a variety of reasons.",
        language: "javascript",
        languageName: "JavaScript",
        author: "@shadowfiend",
        authorUrl: "http://twitter.com/shadowfiend",
        code: "> Array.indexOf(3)\n\"Object has no method indexOf.\"\n> $(document).ready()\nOK.\n\n\nHI"
      }
    ]
  }
  
  res.render 'index', data
