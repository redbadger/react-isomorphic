React Isomorphic
---
This is an experimental playground to try and find unobtrusive patterns that might help while building isomorphic web applications using [Facebook React](http://facebook.github.io/react/).

It supports server-side and client-side rendering of react components. Render a page server-side and carry on client-side. Refresh a client-side route and have the server render the page. Deep link into your application at any point and have the server render the first page. Create your site from many 'single-page-applications', all seamlessly running side-by-side. Great for SEO, non-javascript environments and fast page loading with no app startup delay.

Please feel free to use anything you find here, and to contribute ideas by forking the repository and submitting pull requests.

Example
---

###Server-side
Included is an embryonic view engine for express [lib/react-view-engine.ls](lib/react-view-engine.ls) which allows us to `res.render` a react component into a single jade view [views/layout.jade](views/layout.jade):

(from [routes/index.ls](routes/index.ls))

``` livescript
routes.get '/' (req, res) ->
  res.locals.title = "Title"

  # render a react component (components/my-react-component.ls)
  props = is-experimental: true
  res.render 'my-react-component' props: props
```

Plug the view engine into express, specifying a template function for the layout:

(from [app.ls](app.ls))

``` livescript
app.set 'views', path.join __dirname, 'components'
app.set 'view engine', 'ls'
app.engine 'ls' react-view-engine do
  layout: jade.compile do
    fs.read-file-sync do
      path.join __dirname, 'views/layout.jade'
      'utf8'
```

###Client-side
The relevant page's components are rendered again client-side with access to the same props, which have been serialized into a `data-props` attribute on the document element. React determines from the checksum that it doesn't need to update the DOM. If you have client-side routes declared you can carry on client-side. If you have server-side routes that match, you can refresh a client page and have the server render it for you.

(from [components/index.ls](components/index.ls))

``` livescript
require! 'react'

get = document.document-element~get-attribute
props-json = get 'data-props'
props = JSON.parse props-json if props-json

components =
  # needed for browserify's static analysis
  'app0': -> require './app0.ls'
  'app1': -> require './app1.ls'

exports.start = ->
  mount-point = document.get-element-by-id \content
  if mount-point?
    component = components[mount-point.className]!
    instance = component props
    react.render-component instance, mount-point
```

A word about LiveScript
--
Most people use [JSX](http://facebook.github.io/react/docs/jsx-in-depth.html) with React in an attempt to make the markup more HTML-like and therefore designer-friendly. In our experience, designers are clever people who don't like being patronised :-) [LiveScript](http://livescript.net/) is easy to learn and makes for beautiful react components:

``` livescript
tabs = react.create-class do
  display-name: 'Tabs'
  render: ->
    ul class-name: 'tabs',
      li do
        class-name: class-set do
          left: true
          active: @props.color is 'red'
        a href: @format-url 'red', 'Red'
      li do
        class-name: class-set do
          right: true
          active: @props.color is 'blue'
        a href: @format-url 'blue', 'Blue'
```
We make no apology for using LiveScript throughout this project. Its functional qualities are inherited from Haskell, which alone is a great reason to use it! But if you have a strong opinion either way then please raise an issue.

Building and running
--
First install LiveScript and Gulp:

```sh
npm install -g LiveScript gulp
```
Install using `npm` or `git clone`

```sh
npm install react-isomorphic .
cd node_modules/react-isomorphic
```

or

```sh
git clone git@github.com:redbadger/react-isomorphic.git
cd react-isomorphic
```

Then build client-side assets (uses [browserify](http://browserify.org/) to bundle the compiled JavaScript) and run.

```sh
gulp
lsc .
```

You can rebuild automatically when files change by using `gulp dev`.

If you use `npm start` instead of `lsc .` it will run under [supervisor](https://github.com/isaacs/node-supervisor), restarting the app when files are changed.

Navigate to [http://localhost:3000/app0/page1](http://localhost:3000/app0/page1)

License
--
React Isomorphic is licensed under the permissive  [WTFPL](http://www.wtfpl.net/) license.

Contributing
--
Please contribute code, comments, issues, suggestions and ideas. Even better, fork the repo and submit pull requests.
