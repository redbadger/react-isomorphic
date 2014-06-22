require! <[
  ../components/App
  ../components/Another-App
  ./render-component
  express
  react
]>

module.exports = routes = express.Router!

routes.use render-component

routes.get '/' (req, res) ->
  res.render-component do
    App
    title: 'app'
    component: 'app'
    props:
      heading: 'Hello'

routes.get '/another-app' (req, res) ->
  res.render-component do
    Another-App
    title: 'another app'
    component: 'another-app'
