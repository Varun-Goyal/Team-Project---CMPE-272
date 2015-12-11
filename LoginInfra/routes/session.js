exports.isAuthUser = function(req, res, next) {
		if(req.infralift){
			if(req.infralift.user && !req.infralift.admin){
				return next();
			}
		}    
    res.redirect('/');
};

exports.isAuthAdmin = function(req, res, next) {
	if(req.infralift){
		if(req.infralift.admin && !req.infralift.user){
			return next();
		}
	}    
res.redirect('/');
};

exports.redirectHome = function(req, res, next) {
	if(req.infralift){
		if(req.infralift.admin && !req.infralift.user){
			res.redirect('/adminposts');
		}
		if(!req.infralift.admin && req.infralift.user){
			res.redirect('/posts');
		}
	}    
return next();
};
/*
exports.skipAuthUser = function(req, res, next) {
	if(req.ubersession){
		if(req.ubersession.user){
			res.redirect('/customerDashboard');
		}
	}    
return next();
};

exports.skipAuthDriver = function(req, res, next) {
	if(req.ubersession){
		if(req.ubersession.driver){
			res.redirect('/');
		}
	}    
return next();

};
*/