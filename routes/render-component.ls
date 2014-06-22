require! <[
  react
]>

module.exports = (req, res, next) ->
  res.render-component = (component, ^^locals) ->
    locals.content = react.render-component-to-string component locals.props
    res.render 'layout' locals
  next!
