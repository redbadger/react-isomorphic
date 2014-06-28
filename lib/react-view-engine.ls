require! <[
  react
  path
]>

module.exports = (options) ->
  options = options or {}

  (view, locals, callback) ->
    view-file-name = path.relative locals.settings.views, view
    locals.component = view-file-name - ".#{locals.settings['view engine']}"
    locals.props = locals._locals.{}props import locals.props
    delete locals._locals
    delete locals.cache
    delete locals.settings

    try
      Component = require view
      locals.content =
        react.render-component-to-string new Component locals.props

      callback null, options.layout locals
    catch e
      console.error e.stack
      callback new Error 'Could not require component: ' + view
