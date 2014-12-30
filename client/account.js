Template.Account.events({
  'click #signOut': function () {
    Meteor.logout(function (err) {
      Router.go('Home');
    });
  }
});
