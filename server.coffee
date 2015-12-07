express = require 'express'
compression = require 'compression'
request = require 'request'

app = express()

app.use compression()

# Force cache to clear for deploys
app.use (req, res, next) ->
  res.set 'Access-Control-Allow-Origin', 'http://localhost:3000'
  res.set 'Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE'
  res.set 'Access-Control-Allow-Headers', 'X-Requested-With,content-type,Cache-Control'
  res.set 'Access-Control-Allow-Credentials', true
  res.set 'Cache-Control', 'no-cache, must-revalidate' if req.url.match /index.html/
  next()

app.post '/documents', (req, res) ->
  res.send 'hello'

app.listen process.env.PORT or 9000
