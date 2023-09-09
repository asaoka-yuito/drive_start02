const { environment } = require('@rails/webpacker')

const sass = require('./loaders/sass')

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
  })
)
environment.loaders.append('sass', sass)
module.exports = environment

