require! <[
  ./components/App
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
    title: 'test'
    content: react.render-component-to-string new App!

app.use routes

module.exports = app
