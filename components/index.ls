require! 'react'

get = document?document-element~get-attribute
props-json = get? 'data-props'
props = JSON.parse props-json if props-json

components =
  'app': -> require './app.ls'
  'another-app': -> require './another-app.ls'

exports.start = ->
  root = document.get-element-by-id \content
  if root?
    Component = components[root.className]!
    react.render-component (new Component props), root
