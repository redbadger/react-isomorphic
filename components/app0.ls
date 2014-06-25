require! <[
  ./list-item.ls
  page
  react
]>

{div, h1, ul} = react.DOM

module.exports = react.create-class do
  display-name: 'App0'
  get-initial-state: ->
    page: @props.page
  component-did-mount: ->
    page '/app0/:page' ~> @set-state page: it.params.page
    page.start!
  render: ->
    div null,
      h1 null, "app0 #{@state.page}"
      ul null,
        list-item app: 0, page: 'page1'
        list-item app: 0, page: 'page2'
        list-item app: 1, page: 'page1'
        list-item app: 1, page: 'page2'
