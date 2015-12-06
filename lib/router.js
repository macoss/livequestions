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

//Secure the admin routes
Router.onBeforeAction(function (pause) {
  if (!this.ready()) {
    this.render('myLoadingTemplate');
    pause(); // otherwise the action will just render the main template.
  }

  this.next();

});

Router.onBeforeAction(mustBeSignedIn, {except: ['Home','Screen','postSms','Login']});


  //mustBeSignedIn, {except: ['Home','Screen','postSms']});

//Set the document title for all of the pages
Router.onAfterAction(function() {
    document.title = 'Live Questions - '+this.route.name;
});

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

    // Server side route that is for Twilio to post SMS messages
    // this route us using a PostSmsController
    this.route('postSms', { 
	where: 'server', 
	path: '/postsms',
	controller: 'PostSmsController'
    });

});


