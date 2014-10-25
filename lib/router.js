// We are going to centralize all routes in this file.
//

mustBeSignedIn = function() {
  if(Meteor.user()) { 
    return true;
  } else {
    this.redirect('Home');
    return false;
  }
};

//Secure the admin routes
Router.onBeforeAction(mustBeSignedIn, {except: ['Home','Screen','postSms']});

//Set the document title for all of the pages
Router.onAfterAction(function() {
        document.title = 'Live Questions - '+this.route.name;
      }
);

Router.map(function () {
  this.route('Admin', {
    path: '/admin',
    waitOn: function () { return Meteor.subscribe('Messages'); }
  });

  // Display the selected question on screen
  this.route('Screen', {
    path: '/screen',
    waitOn: function() { return Meteor.subscribe('selectedMessages'); },
    data: function() { return Messages.find({ Selected: true }); }
  });

  // Root route
  this.route('Home', {
    path: '/',
    //waitOn: function() { return Meteor.subscribe('questions'); },
    data: function() { return Questions.findOne(); }
  });

  // Server side route that is for Twilio to post SMS messages
  // this route us using a PostSmsController
  this.route('postSms', { 
    where: 'server', 
    path: '/postsms',
    controller: 'PostSmsController'
  });

});


