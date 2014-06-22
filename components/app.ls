require! <[
  react
]>

{div, h1, a} = react.DOM

module.exports = react.create-class do
  display-name: 'App'
  render: ->
    div null,
      h1 null, @props.heading
      a href: '/another-app', 'Another App'
