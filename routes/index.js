// GET / - Homepage
exports.index = function(req, res) {
  var data = {
    title: "#102 Excellent CSS",
    summary: "This is an example of some weird stuff.",
    code: "#container {\n\tdisplay: none\n\tzoom-level:1\n}"
  }
  
  res.render('index', data)
};
