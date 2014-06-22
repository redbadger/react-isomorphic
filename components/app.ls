require! <[
  react
]>

{div} = react.DOM

module.exports = react.create-class do
  display-name: 'App'
  render: ->
    div null, 'test'
