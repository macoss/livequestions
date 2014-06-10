// This is a main page for the application.

Template.incomming.smsMessages = function () {
  return Messages.find({Approved: false, DeletedAt: {$exists: false}}, {sort: {CreatedAt: 1}});
};

Template.approved.approvedMessages = function () {
  return Messages.find({Approved: true, DeletedAt: {$exists: false}}, {sort: {CreatedAt: 1}});
};

Template.eachMessage.events({
  'click .approveMessage': function () {
    Messages.update(this._id, {$set: {Approved: true}});
  },
  'click .rejectMessage': function () {
    Messages.update(this._id, {$set: {Approved: false}});
  },
  'click .selectedMessage': function () {
    if(this.Selected) {
      Messages.clearSelection(this._id);
    } else {
      Messages.updateSelected(this._id);
    }
  }
});

Template.eachIncommingMessage.events({
  'click .approveMessage': function () {
    Messages.update(this._id, {$set: {Approved: true}});
  },
  'click .deleteMessage': function () {
    var now = new Date();
    Messages.update(this._id, {$set: {DeletedAt: now.valueOf()}});
  }
});
