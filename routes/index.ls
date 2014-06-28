require! <[
  express
  react
]>

module.exports = routes = express.Router!

base-props = (req, res, next) ->
  res.locals.{}props.base = true;
  next!

routes.get '/:app/:page' base-props, (req, res) ->
  res.locals.title = "App #{req.params.app}"

  res.render req.params.app,
    props:
      page: req.params.page
