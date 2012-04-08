express = require 'express'
mongoose = require 'mongoose'
routes = require './routes'
models = require './model/submission'
jqtpl = require 'jqtpl'
app = module.exports = express.createServer();

# Configuration
app.configure () ->
  app.set 'views', __dirname + '/views'
  app.set "view engine", "html"
  app.register ".html", jqtpl.express
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session({ secret: "keyboard cat" })
  app.use app.router
  app.use express.static(__dirname + '/public')

app.configure 'development', () ->
  app.use express.errorHandler({ dumpExceptions: true, showStack: true })
  mongoose.connect "mongodb://localhost/wat-dev"
  app.listen 3000


app.configure 'production', () ->
  app.use express.errorHandler()
  mongoose.connect "mongodb://localhost/wat-prod"
  app.listen 9101

# Routes
app.get '/', routes.index
app.get '/view/:id', routes.view
app.get '/compose', routes.compose
app.get '/category/:category', routes.category

app.post '/submit', routes.submit

console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env
