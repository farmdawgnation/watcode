# GET /view/[id] - View a particular item.
exports.view = (req, res) ->
  # TODO: Pull item from DB.
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
      }
    ]
  }
  
  res.render 'index', data


