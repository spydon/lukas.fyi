var path = require('path');
var HtmlwebpackPlugin = require('html-webpack-plugin');
var webpack = require('webpack');
var merge = require('webpack-merge');

var TARGET = process.env.npm_lifecycle_event;
var ROOT_PATH = path.resolve(__dirname);
var APP_PATH = path.resolve(ROOT_PATH, 'app');

var common = {
    entry: APP_PATH,
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
          loaders: ['babel'],
          include: APP_PATH
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
  ]
};

if(TARGET === 'start' || !TARGET) {
  module.exports = merge(common, {
    devtool: 'eval-source-map',
    devServer: {
      historyApiFallback: true,
      hot: true,
      inline: true,
      progress: true,

      // parse host and port from env so this is easy
      // to customize
      host: process.env.HOST,
      port: process.env.PORT
    },
    plugins: [
      new webpack.HotModuleReplacementPlugin()
    ]
  });
}
