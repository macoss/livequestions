// Define a new collection for messages that are received from Twillo
Messages = new Meteor.Collection("messages");

Messages.clearSelection = function() {
  Meteor.call('clearMessageSelection');
};

Messages.updateSelected = function(messageId) {
  this.clearSelection();
  this.update(messageId, {$set: {Selected: true}});
  return true;
};

Messages.getLastMessage = function() {
  return this.findOne({}, {sort: {CreatedAt: -1}});
};
