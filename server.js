require('dotenv').config()
const express = require('express')
const { createProxyMiddleware } = require('http-proxy-middleware')
const app = express()
const port = 9000
app.use(express.static('dist'))

// app.get('/parks/*', (req, res, next) => {
//     console.log(req.originalUrl)
// })

// app.get('/weather/*', (req, res, next) => {
//     console.log(req.originalUrl)
// })

app.use(
    '/parks',
    createProxyMiddleware({
      target: process.env.PARKS_ENDPOINT,
      changeOrigin: true
    }),
  );

  app.use(
    '/weather',
    createProxyMiddleware({
      target: process.env.WEATHER_ENDPOINT,
      changeOrigin: true
    }),
  );

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})