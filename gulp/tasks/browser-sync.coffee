gulp        = require 'gulp'
browserSync = require 'browser-sync'

gulp.task 'browser-sync', ->
  browserSync {
    server:
      baseDir: "./"
  }