gulp        = require 'gulp'
browserSync = require 'browser-sync'
reload      = browserSync.reload
sass        = require 'gulp-sass'

gulp.task 'sass', ->
  gulp.src 'assets/**/*.scss'
    .pipe sass sourcemap:true
    .pipe gulp.dest ".tmp/public/css"
    .pipe reload stream:true
