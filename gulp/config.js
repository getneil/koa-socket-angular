var dest = "./tmp";
var publicDest = "./tmp/public/";
var src = './assets/';

module.exports = {
  browserSync: {
    server: {
      baseDir: dest
    }
  },
  sass: {
    src: src + "**/*.{sass,scss}",
    dest: publicDest,
    settings: {
      indentedSyntax: true, // Enable .sass syntax!
      imagePath: 'images' // Used by the image-url helper
    }
  },
  coffee:{

  },
  images: {
    src: src + "/images/**",
    dest: publicDest + "/images"
  },
  production: {
    cssSrc: dest + '/*.css',
    jsSrc: dest + '/*.js',
    dest: dest
  }
};
