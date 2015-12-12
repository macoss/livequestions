// We are going to centralize all routes in this file.
//

mustBeSignedIn = function() {
    if(Meteor.user()) {
        this.next();
		return true;
    } else {
		this.redirect('Home');
        Notifications.error("Authorization", "You must to logged in to access this page.");
		return false;
    }
};

setTitle = function() {
	document.title = 'Live Questions = ' + this.route.getName();
};

Router.onBeforeAction(function () {
 	if (!this.ready()) {
    	this.render('myLoadingTemplate');
  	} else {
		this.next();
	}	
});

//Secure the admin routes
Router.onBeforeAction(mustBeSignedIn, {except: ['Home','Screen','postsms','Login']});


  //mustBeSignedIn, {except: ['Home','Screen','postSms']});

// Set the document title for most of the pages
Router.onAfterAction(setTitle, {except: ['postsms']});

Router.map(function () {
    this.route('Login', {
	path: '/login'
    });
    
    this.route('Admin', {
	path: '/admin',
	waitOn: function () { return [Meteor.subscribe('Messages'),
								Meteor.subscribe('Topics')] }
    });

    this.route('Account', {
      path: '/account'
    });

    // Display the selected question on screen
    this.route('Screen', {
	path: '/screen',
	waitOn: function() { return Meteor.subscribe('selectedMessages'); },
	//data: function() { return Messages.find({ Selected: true }); }
    });

    // Root route
    this.route('Home', {
	path: '/',
	waitOn: function() { return Meteor.subscribe('Topics'); },
	//data: function() { return Questions.findOne(); }
    });
});

// Server side route that is for Twilio to post SMS messages
// this route us using a PostSmsController
Router.route('/postsms', {
	where: 'server',
	controller: 'PostSmsController'
});

