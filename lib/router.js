// We are going to centralize all routes in this file.
Router.map(function () {
  this.route('admin', {path: '/admin'});

  // Display the selected question on screen
  this.route('screen', {
    path: '/screen',
    data: function() { return Messages.find({ Selected: true }); }
  });

  // Root route
  this.route('index', {
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


