require! <[
  ./components/App
  ./components/Another-App
  body-parser
  express
  path
  react
]>

app = express!

app.use express.static path.join __dirname, 'public'
app.use body-parser.json!

is-dev = (app.get 'env') is 'development'

app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'
app.locals.pretty = is-dev

routes = express.Router!

routes.get '/' (req, res) ->
  res.render do
    'layout'
    title: 'app'
    component: 'app'
    content: react.render-component-to-string new App!

routes.get '/another-app' (req, res) ->
  res.render do
    'layout'
    title: 'another app'
    component: 'another-app'
    content: react.render-component-to-string new Another-App!

app.use routes

module.exports = app
