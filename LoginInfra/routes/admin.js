var ejs = require("ejs");
var mysql = require('./mysql');

exports.getUnapprovedPosts = function(req,res){
	var Query = "select r.REQUEST_ID, r.NAME_OF_INFRA, r.ADDRESS, r.ZIPCODE, r.COUNTRY, r.STATE, r.DESCRIPTION, Date(r.DATE_UPLOADED) as Date, r.USER_ID , r.IS_ACTIVE, r.IMAGEFILE from request r where r.IS_ACTIVE=0;";
	
		mysql.executeQuery(function(err,results){
			if(err){
				throw err;
			}
			else 
			{
				if(results.length > 0){	
					var i;
					var Posts = [];
					for (i=0;i<results.length;i++){
						var Post = {
						  ID: results[i].REQUEST_ID,
						  NAME: results[i].NAME_OF_INFRA,
						  ADDRESS: results[i].ADDRESS,
						  ZIPCODE: results[i].ZIPCODE,
						  COUNTRY: results[i].COUNTRY,
						  STATE: results[i].STATE,
						  DESCRIPTION: results[i].DESCRIPTION,
						  USER_ID: results[i].USER_ID,
						  IMAGEFILE: results[i].IMAGEFILE
						};
						Posts.push(Post);
					}
					res.send({Posts:Posts, Status:"Success"});
				}
				else {					
					res.send({Status:"Error"});
				}
			}  
		},Query);
};

exports.getapprovepage = function(req,res){
	res.render('approve');
};

exports.approve = function(req,res){
	var REQUEST_ID = req.body.post_id;
	console.log(REQUEST_ID);
	
	
	var SQL_Query = "Update request set IS_ACTIVE = 1 where REQUEST_ID='"+REQUEST_ID+"';";
	mysql.executeQuery(function(err,results){
		if(err){
			throw err;
		}
		else 
		{

			console.log(results);
			if(results.affectedRows == 1){	
				res.send({Status:"Success"});
			}
			else {					
				res.send({Status:"Error"});
			}
		}  
	},SQL_Query);
	
};

exports.admincontacts = function(req,res){
	var SQL_Query = "SELECT * FROM mailing_list";
	mysql.executeQuery(function(err,results){
		if(err){
			throw err;
		}
		else 
		{
			var i;
			var Contacts = [];
			for (i=0;i<results.length;i++){
				var Contact = {
				  ID: results[i].EMAIL_ID,
				  ZIPCODE: results[i].ZIPCODE,
				  COUNTRY: results[i].COUNTRY,
				  STATE: results[i].STATE,
				};
				Contacts.push(Contact);
			}
			res.send({Contacts:Contacts, Status:"Success"});
		}  
	},SQL_Query);
};


exports.addcontact = function(req,res){	
	
	var ZIPCODE = req.param("zipcode");
	var EMAIL_ID = req.param("email_id");
	var STATE =req.param("state");
	var COUNTRY = req.param("country");
	
	var SQL_Query = "INSERT INTO `mailing_list`(`ZIPCODE`,`EMAIL_ID`,`STATE`,`COUNTRY`)VALUES('"+ZIPCODE+"','"+EMAIL_ID+"','"+STATE+"','"+COUNTRY+"');";

	mysql.executeQuery(function(err,results){
		if(err){
			console.log('here');
			res.render('addcontacts',{MsgId:"2"});
		}
		else 
		{
			//console.log(results);
			if(results.affectedRows == 1){	
				res.render('addcontacts',{MsgId:"1"});
			}
			else {		
				console.log('here2');
				res.render('addcontacts',{MsgId:"2"});
			}
		}  
	},SQL_Query);
	
};


exports.addnewcontact = function(req,res){
	res.render('addcontacts');
};

exports.viewcontacts = function(req,res){
	res.render('viewcontacts');
};




exports.adminPage = function(req,res) {
	var results = "select ADDRESS from request";
	console.log("Query is:"+results);
	
	mysql.executeQuery(function(err,results){
		if(err){
			throw err;
		}
		else 
		{
			ejs.renderFile('./views/adminPage.ejs',{ data: results },function(err, result) {
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
 },results);
};

exports.analytics = function(req,res) {
	var results = "SELECT count(*) as Count, ZIPCODE FROM `request` group by ZIPCODE";
	console.log("Query is:"+results);
	
	mysql.executeQuery(function(err,results){
		if(err){
			throw err;
		}
		else 
		{
			var results2 = "select COUNT(*) as DATECount, DATE_FORMAT(DATE_UPLOADED,'%m-%d-%Y') as DATE_UPLOADED from `request` group by DATE_UPLOADED";
			console.log("Query is:"+results2[0]['DATE_UPLOADED']);
			mysql.executeQuery(function(err,results2){
				if(err){
					throw err;
				}
				else 
				{
					var results3 = "select COUNT(*) as StateCount, STATE from `request` group by STATE";
					console.log("Query is:"+results3[0]['STATE']);
					mysql.executeQuery(function(err,results3){
						if(err){
							throw err;
						}
						else 
						{
							ejs.renderFile('./views/analytics.ejs',{ resdata: results, resdata2: results2, resdata3: results3},function(err, result) {
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
					},results3);
				}
			},results2);
		}
 },results);
};


exports.analyticspage = function(req,res){
	
	var query = "select ADDRESS from request";
	
	mysql.executeQuery(function(err,results){
		if(err){
			throw err;
		}
		else 
		{
			var query2 = "SELECT count(*) as Count, ZIPCODE FROM `request` group by ZIPCODE";			
			
			mysql.executeQuery(function(err,results1){
				if(err){
					throw err;
				}
				else 
				{
					var query3 = "select COUNT(*) as DATECount, DATE_FORMAT(DATE_UPLOADED,'%m-%d-%Y') as DATE_UPLOADED from `request` group by DATE_UPLOADED";
					
					mysql.executeQuery(function(err,results2){
						if(err){
							throw err;
						}
						else 
						{
							var query4 = "select COUNT(*) as StateCount, STATE from `request` group by STATE";
							
							mysql.executeQuery(function(err,results3){
								if(err){
									throw err;
								}
								else 
								{
									res.render('analyticspage',{ data: results, resdata: results1, resdata2: results2, resdata3: results3});									
								}
							},query4);
						}
					},query3);
				}
		 },query2);
		}
	},query);
	
};

exports.signin = function(req,res){
	res.render('adminsignin');
}

exports.afterSignIn = function (req,res){
	var getUser="select * from admin where ADMIN_NAME='"+req.param("inputUsername")+"' and PASSWORD='" + req.param("inputPassword") +"'";
	console.log("Query is:"+getUser);
	
	mysql.executeQuery(function(err,results){
		if(err){
			res.render('adminsignin', { msgId: '1'});
		}
		else 
		{
			if(results.length > 0){
				if(req.infralift){
					req.infralift.reset();
				}
				req.infralift.admin = results[0];
				console.log("valid Login");
				console.log(req.infralift.admin);
				res.redirect('/adminposts');
			}
			else {
				console.log("Invalid Login");
				res.render('adminsignin', { msgId: '3'});
			}
		}  
	},getUser);
};
