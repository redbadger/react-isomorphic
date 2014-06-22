require! <[
  ./app
]>

global import require 'prelude-ls' unless fold?

# when running under iisnode, process.env.PORT is a named pipe ...
server = app.listen (process.env.PORT or 3000), ->
  console.log "Express server listening at #{JSON.stringify server.address!}"
