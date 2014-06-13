// We are going to centralize all routes in this file.
Router.map(function () {
  this.route('admin', {
    path: '/admin',
    waitOn: function () { return Meteor.subscribe('Messages'); },
/*    onBeforeAction: function (pause) {
      if (!Meteor.user()) {
        // render the login template but keep the url in the browser the same
        window.alert('Must be logged in to access this page!');
        this.redirect('index');

        // pause the rest of the before hooks and the action function 
        pause();
      }
    } */
  });

  // Display the selected question on screen
  this.route('screen', {
    path: '/screen',
    waitOn: function() { return Meteor.subscribe('selectedMessages'); },
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



