gulp        = require 'gulp'
jade        = require 'gulp-jade'
livereload  = require 'gulp-livereload'
nodemon     = require 'gulp-nodemon'
linker      = require 'gulp-linker'

paths =
  views       : 'src/**/*.jade'
  styles      : 'src/**/*.scss'
  images      : 'src/images/**/*'
  scripts     : 'src/**/*.coffee'
  dest        : 'public'

gulp.task 'views', ->
  gulp.src paths.views
    .pipe jade()
    .pipe livereload()
    .pipe gulp.dest 'public/templates/'

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
gulp.task 'link', ->
  gulp.src "views/*jade"
    .pipe linker {
        scripts:["public/js/dependencies/*.js","public/js/**/*.js"]
        startTag: '// JS'
        endTag: '// JS END'
        fileTmpl : 'script(src="%s")'
        appRoot: 'public/'
      }
    .pipe linker {
        scripts:["public/styles/dependencies/*.css","public/styles/**/*.css"]
        startTag: '// STYLES'
        endTag: '// STYLES END'
        fileTmpl : 'link(href="%s")'
        appRoot: 'public/'
      }
    .pipe gulp.dest 'views'


###
gulp.src('templates/*.html')
  // Link the JavaScript
  .pipe(linker({
    scripts: [ "www/js/*.js " ],
    startTag: '',
    endTag: '',
    fileTmpl: '<script src="%s"></script>',
    appRoot: 'www/'
  }))
  // Write modified files to www/
  .pipe(gulp.dest('www/'));
###
gulp.task 'watch', ->
  livereload.listen();
  gulp.watch paths.views       , ['views']
  gulp.watch 'views/**/*.jade' , ['rendered-views']


gulp.task 'default', ['link','views', 'watch', 'server']