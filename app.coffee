express = require 'express'
mongoose = require 'mongoose'
routes = require './routes'
models = require './model/submission'
jqtpl = require 'jqtpl'
MongoStore = require 'connect-mongo'

app = module.exports = express.createServer();

# Configuration
app.configure () ->
  app.set 'database', process.env.DATASTORE || "wat-dev"
  app.set 'views', __dirname + '/views'
  app.set "view engine", "html"
  app.register ".html", jqtpl.express
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  mongoose.connect "mongodb://localhost/" + app.settings.database
  app.use express.session({ secret: "wakkwakkawakka123", store: new MongoStore({ db: app.settings.database }) })
  app.use app.router
  app.use express.static(__dirname + '/public')

app.configure 'development', () ->
  app.use express.errorHandler({ dumpExceptions: true, showStack: true })
  app.listen 3000


app.configure 'production', () ->
  app.use express.errorHandler()
  app.listen process.env.PORTNUMBER || 9101

# Routes
app.get '/', routes.index
app.get '/view/:id', routes.view
app.get '/compose', routes.compose
app.get '/language/:language', routes.language

app.post '/submit', routes.submit

console.log "Using database: " + app.settings.database
console.log "Using ReCAPTCHA API KEY: " + process.env.RECAPTCHAKEY
console.log "Using ReCAPTCHA PRIVATE KEY: " + process.env.RECAPTCHAPRIVATEKEY
console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env
