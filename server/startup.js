// Server startup file
Meteor.startup(function () {
  Accounts.config({
    forbidClientAccountCreation : true
  });
  // code to run on server at startup
  //
  // TODO: This finction should be protected from the client:
  return Meteor.methods({

    removeAllMessages: function() {
      return Messages.remove({});
    },

    clearMessageSelection: function() {
      return Messages.update({ Selected: true }, {$set: {Selected: false}});
    }

  });
});

