//display a single screen

Template.message.selectedMessage = function () {
  return Messages.find({Selected: true});
};
