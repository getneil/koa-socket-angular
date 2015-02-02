var requireDir = require('require-dir');

	require('coffee-script/register');

	requireDir('./gulp/tasks', { recurse: true });
	requireDir('./gulp/builds', { recurse: true });
//require('./gulpfile.coffee');