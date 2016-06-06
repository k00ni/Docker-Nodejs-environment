
var gulp = require('gulp');
var babel = require('gulp-babel');
var gutil = require('gulp-util');
var webpack = require('webpack');
var webpackConfig = require('./webpack.config.js');
var WebpackDevServer = require('webpack-dev-server');

gulp.task('default', ['server']);

gulp.task('webpack', function(callback) {
  var myConfig = Object.create(webpackConfig);
  // myConfig.plugins = [
  // new webpack.optimize.DedupePlugin(),
  // new webpack.optimize.UglifyJsPlugin()
  // ];

  // run webpack
  webpack(myConfig, function(err, stats) {
    if (err) throw new gutil.PluginError('webpack', err);
    gutil.log('[webpack]', stats.toString({
      colors: true,
      progress: true
    }));
    callback();
  });
});

gulp.task('server',['webpack'], function(callback) {
	// modify some webpack config options
	var myConfig = Object.create(webpackConfig);
	// Start a webpack-dev-server
	new WebpackDevServer(webpack(myConfig), {
        contentBase: myConfig.devServer.contentBase,
        // Enable history API fallback so HTML5 History API based
        // routing works. This is a good default that will come
        // in handy in more complicated setups.
        historyApiFallback: true,
        hot: true,
        inline: true,
        progress: true,
        port: 8080,
        host: '0.0.0.0',
        stats: {
            colors: true
        },
        watchOptions: {
          poll: 1000
        },
    }).listen(8080, '0.0.0.0', function(err) {
		if(err) throw new gutil.PluginError('webpack-dev-server', err);
		gutil.log('[webpack-dev-server]', 'http://0.0.0.0:8080/');
	});
});
