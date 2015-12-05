Template.topic.helpers({
	latestTopic: function() {
		return Topics.find({}, {sort: {Body: 1},limit: 1});
	}
});
