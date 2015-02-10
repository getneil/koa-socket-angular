var koa = require('koa'),
	app = module.exports = koa(),
	router = require('koa-router'),
	views = require('co-views'),
	render = views('views/'),
	livereload = require('koa-livereload'),
	serve = require('koa-static');

app.use(router(app));

app.use(serve('.tmp/public/'));

app.use(livereload({
	src  : "http://192.168.30.12:35729/livereload.js"
}));

app.get('/', function*() {
  return this.body = yield render('index.jade');
});

app.listen(3000);
console.log("listening at ubuntu.vm:3000");