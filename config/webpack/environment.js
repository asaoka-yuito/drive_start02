const { environment } = require('@rails/webpacker')

const sass = require('./loaders/sass')

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
environment.loaders.append('sass', sass)
module.exports = environment

