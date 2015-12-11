var ejs = require("ejs");
var mysql = require('./mysql');
var https = require("https");


function signin(req,res) {
	res.render('signin');
}

function signup(req,res) {
	res.render('signup');
}

function forgotEmail(req,res) {
	res.render('forgotEmail');
}

function makepost(req,res) {
	res.render('makePost');
}

function afterSignUp(req,res)
{
	
	var inputLname = req.param('inputLname');
	var inputFname = req.param('inputFname');
	var inputEmail = req.param("inputEmail");
	var inputPassword = req.param("inputPassword");
	var inputDOB = req.param("inputDOB");
	var inputGender = req.param("inputGender");
	var inputState = req.param("inputState");
	var inputCountry = req.param("inputCountry");
	var inputZip = req.param("inputZip");
	
	var options = {
			  host: 'maps.googleapis.com',
			  port:'443',
			  path: '/maps/api/geocode/json?components=postal_code:'+inputZip+'|administrative_area:'+inputState+'|country:'+inputCountry+'&key=AIzaSyAXDDyKswv88pTWxbkZol0EmvNZ4TqD5yw'
			};
	//console.log('https://'+options.host+options.path);
	var callback = function(response) {
	  var str = '';
	  response.on('data', function (chunk) {
	    str += chunk;
	  });
	  response.on('end', function () {
		  var flag = false;
		  if(JSON.parse(str).results[0]){
			  if(JSON.parse(str).results[0].geometry){
				  if(JSON.parse(str).results[0].geometry.location){
					  flag = true;
				  	var lat = JSON.parse(str).results[0].geometry.location.lat;
				  	var lng = JSON.parse(str).results[0].geometry.location.lng;
				  	var insertData = "INSERT INTO `user`(FNAME,LNAME,EMAIL,PASSWORD,USERNAME,DOB,GENDER,STATE,COUNTRY,ZIPCODE,LAT,LNG)VALUES('"+inputFname+"','"+inputLname+"','"+inputEmail+"','"+inputPassword+"','"+inputEmail+"','"+inputDOB+"','"+inputGender+"','"+inputState+"','"+inputCountry+"','"+inputZip+"','"+lat+"','"+lng+"');";
				    mysql.insertData(insertData,function(err,results){
			    		if(err){
			    			throw err;
			    		}
			    		else 
			    		{                	
			                //console.log("User Created");
			                res.render('signin', { msgId: '2' });
			    		}
					});
				  }
			  }
		  }
		  if(!flag){
			  var insertData = "INSERT INTO `user`(FNAME,LNAME,EMAIL,PASSWORD,USERNAME,DOB,GENDER,STATE,COUNTRY,ZIPCODE,LAT,LNG)VALUES('"+inputFname+"','"+inputLname+"','"+inputEmail+"','"+inputPassword+"','"+inputEmail+"','"+inputDOB+"','"+inputGender+"','"+inputState+"','"+inputCountry+"','"+inputZip+"','"+"39.50"+"','"+"-98.35"+"');";
			    mysql.insertData(insertData,function(err,results){
		    		if(err){
		    			throw err;
		    		}
		    		else 
		    		{                	
		    			//console.log("User Created");
		                res.render('signin', { msgId: '2' });
		    		}
				});
		  }		  	
	  });
	};
	
	https.request(options, callback).end();	
}

function afterSignIn(req,res)
{
	var getUser="select * from user where email='"+req.param("inputUsername")+"' and password='" + req.param("inputPassword") +"'";
	//console.log("Query is:"+getUser);
	
	mysql.executeQuery(function(err,results){
		if(err){
			throw err;
		}
		else 
		{
			if(results.length > 0){
				if(req.infralift){
					req.infralift.reset();
				}
				req.infralift.user = results[0];
				//console.log("valid Login");
				//console.log(req.infralift.user);
				res.redirect('/posts');
			}
			else {
				console.log("Invalid Login");
				res.render('signin', { msgId: '3'});
			}
		}  
	},getUser);
}

function getAllUsers(req,res)
{
	var getAllUsers = "select * from user";
	//console.log("Query is:"+getAllUsers);
	
	mysql.executeQuery(function(err,results){
		if(err){
			throw err;
		}
		else 
		{
			if(results.length > 0){
				
				var rows = results;
				var jsonString = JSON.stringify(results);
				var jsonParse = JSON.parse(jsonString);
				
				console.log("Results Type: "+(typeof results));
				console.log("Result Element Type:"+(typeof rows[0].emailid));
				console.log("Results Stringify Type:"+(typeof jsonString));
				console.log("Results Parse Type:"+(typeof jsString));
				
				console.log("Results: "+(results));
				console.log("Result Element:"+(rows[0].emailid));
				console.log("Results Stringify:"+(jsonString));
				console.log("Results Parse:"+(jsonParse));
				
				ejs.renderFile('./views/successLogin.ejs',{data:jsonParse},function(err, result) {
			        // render on success
			        if (!err) {
			            res.end(result);
			        }
			        // render or error
			        else {
			            res.end('An error occurred');
			            console.log(err);
			        }
			    });
			}
			else { 
				console.log("No users found in database");
				res.render('failLogin', {});
			}
		}  
	},getAllUsers);
}

function afterForgot(req,res)
{
	
	var inputEmail = req.param("inputUsername");
	var getUser="select EMAIL from user where EMAIL = '" + inputEmail + "';";
	console.log("Query is:"+getUser);
	mysql.executeQuery(function(err,results){
		if(err){
			throw err;
		}
		else 
		{
			if(results.length > 0){

				    var text = "";
				    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

				    for( var i=0; i < 5; i++ ){
				        text += possible.charAt(Math.floor(Math.random() * possible.length));
				    }
				    console.log(text);
				    
				    var mailer = require("nodemailer");
				    
				    var smtpTransport = mailer.createTransport("SMTP",{
				        service: "gmail",
				        auth: {
				            user: "infralift@gmail.com",
				            pass: "infralift@12345"
				        }
				    });

				    var mail = {
				        from: "Infra Lift <infralift@gmail.com>",
				        to: inputEmail,
				        subject: "Password Reset Requested",
				        text: "Your New Password is: "+text+". Please remember to change your password on next logon - The InfraLift Team",
				        html: "Your New Password is: "+"<b>" + text+ "</b>"+". Please remember to change your password on next logon <br/><br/><b>- The InfraLift Team</b>"
				    }

				    smtpTransport.sendMail(mail, function(error, response){
				        if(error){
				            console.log(error);
				        }else{
				            console.log("Message sent: " + response.message);
				        }

				        smtpTransport.close();
				        
				        var putUser="UPDATE user SET PASSWORD='"+ text +"' where EMAIL = '"+ inputEmail + "';";				    	
				    	console.log("Query is:"+putUser);
				    	mysql.executeQuery(function(err,results){
				    		if(err){
				    			throw err;
				    		}
				    		else 
				    		{
				    			res.render('signin', { msgId: '1' });
				    		}  
				    	},putUser);
				
				    });
			}
			else
			{
				res.render('failLogin', {});
			}
		}  
	},getUser);
}


function getlocalposts(req, res){
		var Query = "CALL `sorted_request`('"+req.infralift.user.USER_ID+"');";
			//console.log('here');
			mysql.executeQuery(function(err,results){
				if(err){
					throw err;
				}
				else 
				{
					if(results[0].length > 0){	
						var i;
						var Posts = [];
						var result = results[0];
						for (i=0;i<result.length;i++){
							var Post = {
							  ID: result[i].REQUEST_ID,
							  NAME: result[i].NAME_OF_INFRA,
							  ADDRESS: result[i].ADDRESS,
							  ZIPCODE: result[i].ZIPCODE,
							  COUNTRY: result[i].COUNTRY,
							  STATE: result[i].STATE,
							  DESCRIPTION: result[i].DESCRIPTION,
							  USER_ID: result[i].USER_ID,
							  IMAGEFILE: result[i].IMAGEFILE,
							  FIRST_NAME: result[i].FNAME,
							  LAST_NAME:result[i].LNAME,
							};
							Posts.push(Post);
						}
					//	console.log(Posts);
						res.send({Posts:Posts, Status:"Success"});
					}
					else {					
						res.send({Status:"Error"});
					}
				}  
			},Query);
}


function getcomments(req, res){
	var REQUEST_ID = req.body.post_id;
	var Query = "CALL `get_comments`('"+REQUEST_ID+"');";
		//console.log(Query);
		mysql.executeQuery(function(err,results){
			if(err){
				throw err;
			}
			else 
			{
				if(results[0].length > 0){	
					var i;
					var Comments = [];
					var result = results[0];
					for (i=0;i<result.length;i++){
						var Comment = {
						  ID: result[i].COMMENT_ID,
						  TEXT: result[i].COMMENT_TEXT,
						  USER_ID: result[i].USER_ID,
						  FNAME: result[i].FNAME,
						  LNAME: result[i].LNAME,
						  IMAGEFILE: result[i].IMAGEFILE
						};
						Comments.push(Comment);
					}
					//console.log(Comments);
					res.send({Comments:Comments, Status:"Success"});
				}
				else {					
					res.send({Status:"Error"});
				}
			}  
		},Query);
}


function posts(req, res){
	res.render('viewposts');
}

function insertcomments(req, res){
	var REQUEST_ID = req.body.post_id;
	var COMMENT_TEXT = req.body.comment_txt;
	var USER_ID = req.infralift.user.USER_ID;
	var SQL_Query = "CALL `insert_comments`("+REQUEST_ID+",'"+COMMENT_TEXT+"',"+USER_ID+");";
	
	mysql.executeQuery(function(err,results){
		if(err){
			throw err;
		}
		else 
		{
		//	console.log(results.affectedRows);
			if(results.affectedRows == 1){
				var Comment = {
				  ID: REQUEST_ID,
				  TEXT: COMMENT_TEXT,
				  USER_ID: USER_ID,
				  FNAME: req.infralift.user.FNAME,
				  LNAME: req.infralift.user.LNAME,
				  IMAGEFILE: req.infralift.user.IMAGEFILE
				};
				res.send({Comment:Comment, Status:"Success"});
			}
			else {					
				res.send({Status:"Error"});
			}
		}  
	},SQL_Query);
	
	
}

exports.insertcomments = insertcomments;
exports.getcomments = getcomments;
exports.posts = posts;
exports.getlocalposts = getlocalposts;
exports.forgotEmail=forgotEmail;
exports.afterForgot=afterForgot;
exports.afterSignUp=afterSignUp;
exports.signin=signin;
exports.signup=signup;
exports.afterSignIn=afterSignIn;
exports.getAllUsers=getAllUsers;
exports.makepost=makepost;