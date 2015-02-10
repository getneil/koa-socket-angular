gulp        = require 'gulp'
jade        = require 'gulp-jade'
livereload  = require 'gulp-livereload'
nodemon     = require 'gulp-nodemon'
linker      = require 'gulp-linker'
gulpIf      = require 'gulp-if'
argv        = require('yargs').argv

paths =
  views       : 'src/**/*.jade'
  styles      : 'src/**/*.scss'
  images      : 'src/images/**/*'
  scripts     : 'src/**/*.coffee'
  dest        : 'public'

gulp.task "copy",->
  gulp.src "src/vendor"
    .pipe gulp.dest ".tmp/public/"

gulp.task "link",->
  gulp.src "views/**/*.jade"
    .pipe linker {
        scripts: [ ".tmp/public/vendor/js/**/*.js " ]
        startTag: '// JS'
        endTag: '// JS END'
        fileTmpl: 'script(src="%s")'
        appRoot: '.tmp/public/'
      }
    .pipe linker {
        scripts: [ ".tmp/public/vendor/css/**/*.css " ]
        startTag: '// STYLES'
        endTag: '// STYLES END'
        fileTmpl: 'link(href="%s",rel="stylesheet",type="text/css")'
        appRoot: '.tmp/public/'
      }
    .pipe gulp.dest 'views/'

gulp.task 'views', ->
  gulp.src paths.views
    .pipe jade()
    .pipe livereload()
    .pipe gulp.dest '.tmp/public/templates/'

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
  livereload.listen();
  gulp.watch paths.views       , ['views']
  gulp.watch 'views/**/*.jade' , ['rendered-views']

gulp.task 'default', ['copy','link','views', 'watch', 'server']