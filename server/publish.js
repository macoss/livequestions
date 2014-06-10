Meteor.publish("Messages", function () {
  return Messages.find({DeletedAt: {$exists: false}});
});

Meteor.publish("selectedMessages", function () {
  return Messages.find({Selected: true}, {Body: 1});
});
