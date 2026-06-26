var path = require('path');
var webpack = require('webpack');
var merge = require('webpack-merge');
var HtmlwebpackPlugin = require('html-webpack-plugin');

var TARGET = process.env.npm_lifecycle_event;
var ROOT_PATH = path.resolve(__dirname);
var APP_PATH = path.resolve(ROOT_PATH, 'app');

module.exports = {
  entry: APP_PATH,
  output: {
       path: path.resolve(__dirname, 'build'),
       filename: 'app.bundle.js'
  },
  resolve: {
    extensions: ['', '.js', '.jsx']
  },
  module: {
    loaders: [
      {
        test: /\.css$/,
        loaders: ['style', 'css']
      },
      /* set up jsx */
      {
          test: /\.jsx?$/,
          loader: 'babel-loader',
          include: APP_PATH,
          query: {
              presets: ['react', 'es2015']
          }
      },
      { test: /\.(woff|woff2)$/,  loader: "url-loader?limit=10000&mimetype=application/font-woff" },
      { test: /\.ttf$/,    loader: "file-loader" },
      { test: /\.eot$/,    loader: "file-loader" },
      { test: /\.png$/,    loader: "file-loader" },
      { test: /\.svg$/,    loader: "file-loader" },
      { test: /\.jpg$/,    loader: "file-loader" },
      { test: /\.gif$/,    loader: "file-loader" }
    ]
  },
  plugins: [
    new HtmlwebpackPlugin({
      title: 'Lukas Klingsbo'
    })
  ],
  devtool: 'source-map'
}
