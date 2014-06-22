require! <[
  ./components/App
  ./components/Another-App
  ./routes
  body-parser
  express
  path
]>

app = express!

app.use express.static path.join __dirname, 'public'
app.use body-parser.json!

is-dev = (app.get 'env') is 'development'

app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'
app.locals.pretty = is-dev

app.use routes

module.exports = app
