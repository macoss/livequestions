Template.header.events({
  'click #signOut': function () {
    Meteor.logout();
  }
});
