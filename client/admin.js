// This is a main page for the application.

Template.eachMessage.events({

  'click .buttonReject': function () {
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
  'click .btn-success': function () {
    Messages.update(this._id, {$set: {Approved: true}});
  },
  'click .btn-danger': function () {
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


