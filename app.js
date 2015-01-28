var koa = require('koa'),
	app = module.exports = koa(),
	router = require('koa-router'),
	views = require('co-views'),
	render = views('views/');

app.use(router(app));

app.get('/', function*() {
  return this.body = yield render('index.jade');
});

app.listen(3000);
console.log("listening at ubuntu.vm:3000");