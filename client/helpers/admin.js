Template.incoming.helpers({
  incomingMessages: function() {
    return Messages.find({Approved: false, DeletedAt: {$exists: false}}, {sort: {CreatedAt: 1}});
  }
});

Template.approved.helpers({
  approvedMessages: function() {
    return Messages.find({Approved: true, DeletedAt: {$exists: false}}, {sort: {CreatedAt: 1}});
  }
});

Template.editTopic.helpers({
	topicBody: function() {
		return Topics.findOne({});
	}
});

