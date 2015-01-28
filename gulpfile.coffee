gulp       = require 'gulp'
jade       = require 'gulp-jade'
livereload = require 'gulp-livereload'
nodemon    = require 'gulp-nodemon'

paths =
  views       : 'src/public/**/*.jade'
  styles      : 'src/public/stylesheets/**/*.styl'
  images      : 'src/public/images/**/*'
  scripts     : 'src/public/scripts/**/*.coffee'
  server      : ['src/*.coffee', 'src/routes/*.coffee']
  dest        : 'public'

gulp.task 'views', ->
  gulp.src paths.views
    .pipe jade()
    .pipe gulp.dest paths.dest
    .pipe livereload()

gulp.task 'rendered-views', ->
  gulp.src 'views/**/*.jade'
    .pipe livereload()

gulp.task 'server', ->
  nodemon
    script: 'app.js'
    nodeArgs: ['--harmony']
    ignore: [
      './src/**'
      './test/**'
      './public/**'
      './node_modules/**'
    ]

gulp.task 'watch', ->
  gulp.watch paths.views       , ['views']
  gulp.watch 'views/**/*.jade' , ['rendered-views']


gulp.task 'default', ['views', 'watch', 'server']