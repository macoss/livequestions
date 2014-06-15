// This is a main page for the application.

Template.incoming.smsMessages = function () {
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
    var now = new Date();
    Messages.update(this._id, {$set: {Approved: false, RejectedAt: now.valueOf(), Selected: false}});
  },
  'click .selectedMessage': function () {
    if(this.Selected) {
      Messages.clearSelection();
    } else {
      Messages.updateSelected(this._id);
    }
  }
});

Template.eachIncomingMessage.events({
  'click .approveMessage': function () {
    Messages.update(this._id, {$set: {Approved: true}});
  },
  'click .deleteMessage': function () {
    var now = new Date();
    Messages.update(this._id, {$set: {DeletedAt: now.valueOf()}});
  },
  'click .selectedMessage': function (e,t) {
    UI.insert(UI.renderWithData(Template.editMessage, {message: this}), document.body);
    //e.preventDefault();
    $("#editItem").modal("show");
  }
});

Template.editMessage.events({
  'click .btn-success': function() {
    var edited = document.getElementById("message").value;
    var id = document.getElementById("messageId").value;
    Messages.update(id,{$set: {Body: edited}});
    $("#editItem").bind('hidden', function() {
      $("#editItem").remove();
    }).modal("hide");
  },
  'click .btn-close': function () {
    $("#editItem").bind('hidden', function() {
      $("#editItem").remove();
    }).modal("hide");
  },
  'click .x-close': function () {
    $("#editItem").bind('hidden', function() {
      $("#editItem").remove();
    }).modal("hide");
  }
});


