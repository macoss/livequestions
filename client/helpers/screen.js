Template.message.helpers({
  selectedMessage: function () {
    return Messages.find({Selected: true});
  }
});
