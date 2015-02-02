gulp        = require 'gulp'

gulp.task "copy",->
  gulp.src "assets/vendor/**/*"
    .pipe gulp.dest ".tmp/public/vendor/"