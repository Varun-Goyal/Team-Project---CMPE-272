var routes = require('./routes');
var http = require('http');
var path = require('path');
var express = require('express');
var hogan = require('hogan-express');
var mysql = require('mysql');
var fs = require('fs');
var home = require('./routes/home');
var admin = require('./routes/admin');
var makepost = require('./routes/makepost');
var sessions = require('client-sessions');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('./routes/session');

var port = (process.env.VCAP_APP_PORT || 3000);
var host = (process.env.VCAP_APP_HOST || 'localhost');

// all environments
var app = express();

// all environments
app.set('port', port);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

app.set('env', 'development');
app.engine('html', hogan);

app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());
app.use(express.bodyParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());

app.use(sessions({
    cookieName: 'infralift',
    secret: 'gasghergjrdag',
    duration: 24 * 60 * 60 * 1000,
    activeDuration: 1000 * 60 * 15 
}));
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

app.use(express.cookieParser());

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

/*Pages without authentication*/
app.get('/', session.redirectHome ,routes.index);
app.get('/signin', home.signin);
app.get('/signup', home.signup);
app.get('/admin', admin.signin);
app.get('/forgotEmail', home.forgotEmail);
app.get('/logout',function(req, res){
	req.infralift.reset();
	res.redirect('/');
});
/*Pages without authentication*/

/* Admin Pages */
app.get('/adminposts',session.isAuthAdmin, admin.getapprovepage);
app.get('/addcontacts',session.isAuthAdmin,admin.addnewcontact);
app.get('/viewcontacts',session.isAuthAdmin,admin.viewcontacts);
app.get('/analytics',session.isAuthAdmin, admin.analyticspage);
/* Admin Pages */

/* User Pages */
app.get('/posts',session.isAuthUser,home.posts);
app.get('/makepost',session.isAuthUser,home.makepost);
/* User Pages */


/*API's*/
app.get('/unapprovedposts', admin.getUnapprovedPosts);
app.get('/Image', makepost.getImage);
app.post('/afterSignIn', home.afterSignIn);
app.get('/getAllUsers', home.getAllUsers);
app.post('/afterSignUp', home.afterSignUp);
app.post('/afterForgot', home.afterForgot);
app.post('/uploadpost', makepost.uploadImage);
//app.get('/getimg',makepost.getimg);
app.get('/userposts',home.getlocalposts);
app.post('/approvepost', admin.approve);
app.post('/getcomments',home.getcomments);
app.post('/insertcomments',home.insertcomments);
app.post('/admincontacts',admin.admincontacts);
app.post('/add_email_contact',admin.addcontact);
app.post('/afterAdminSignIn',admin.afterSignIn );
app.post('/getupvotes',makepost.getupvotes );
app.post('/addupvotes',makepost.addupvote );
/*API's*/

/*For routing on 'cannot-get errors'*/

app.use(function(req, res, next) {
    res.redirect('/');
});

// start server
http.createServer(app).listen(app.get('port'), function () {
  console.log('Express server listening at http://' + host + ':' + port);
});
