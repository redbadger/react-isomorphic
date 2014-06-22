require! 'react'

get = document?document-element~get-attribute
props-json = get? 'data-props'
props = JSON.parse props-json if props-json

components =
  'app': -> require './app.ls'
  'another-app': -> require './another-app.ls'

exports.start = ->
  mount-point = document.get-element-by-id \content
  if mount-point?
    component = components[mount-point.className]!
    react.render-component (component props), mount-point
