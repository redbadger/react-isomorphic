require! 'react'

get = document.document-element~get-attribute
props-json = get 'data-props'
props = JSON.parse props-json if props-json

components =
  'app0': -> require './app0.ls'
  'app1': -> require './app1.ls'

exports.start = ->
  mount-point = document.get-element-by-id \content
  if mount-point?
    component = components[mount-point.className]!
    instance = component props
    react.render-component instance, mount-point
