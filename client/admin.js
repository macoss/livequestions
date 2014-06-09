// This is a main page for the application.

Template.incomming.smsMessages = function () {
  return Messages.find({Approved: false}, {sort: {CreatedAt: 1}});
};

Template.approved.approvedMessages = function () {
  return Messages.find({Approved: true}, {sort: {CreatedAt: 1}});
};

Template.eachMessage.events({
  'click .approveMessage': function () {
    Messages.update(this._id, {$set: {Approved: true}});
  },
  'click .rejectMessage': function () {
    Messages.update(this._id, {$set: {Approved: false}});
  },
  'click .selectedMessage': function () {
    Messages.updateSelected(this._id);
  }
});
