require! <[
  react
]>

{li, a} = react.DOM

module.exports = react.create-class do
  display-name: 'List-Item'
  render: ->
    @transfer-props-to li do
      class-name: <[red blue]>[@props.app]
      a do
        href: "/app#{@props.app}/#{@props.page}"
        "#{@props.page} in App#{@props.app}"
