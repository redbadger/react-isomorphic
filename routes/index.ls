require! <[
  ../components/App0
  ../components/App1
  ./render-component
  express
  react
]>

module.exports = routes = express.Router!

routes.use render-component

routes.get '/:app/:page' (req, res) ->
  res.render-component (if req.params.app is 'app0' then App0 else App1),
    title: "App #{req.params.app}"
    component: req.params.app
    props:
      page: req.params.page
