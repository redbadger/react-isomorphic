require! <[
  react
]>

{a} = react.DOM

module.exports = react.create-class do
  display-name: 'Another-App'
  render: ->
    a href: '/', 'The first App'
