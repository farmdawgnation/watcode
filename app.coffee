express = require 'express'
mongoose = require 'mongoose'
routes = require './routes'
admin_routes = require './routes/admin'
jqtpl = require 'jqtpl'
MongoStore = require 'connect-mongo'

# Models
require './model/submission'
require './model/user'

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

# Fontend Routes
app.get '/', routes.index
app.get '/page/:page', routes.index
app.get '/view/:id', routes.view
app.get '/compose', routes.compose
app.get '/language/:language', routes.language
app.get '/language/:language/page/:page', routes.language
app.get '/category/:category', routes.category
app.get '/category/:category/page/:page', routes.category

app.post '/submit', routes.submit

# Admin Routes
app.get '/admin', admin_routes.index
app.get '/admin/dashboard', admin_routes.dashboard
app.get '/admin/login', admin_routes.login
app.get '/admin/logout', admin_routes.logout

app.post '/admin/authenticate', admin_routes.authenticate
app.post '/admin/publish', admin_routes.publish
app.post '/admin/delete', admin_routes.delete

console.log "Express server listening in %s mode", app.settings.env
