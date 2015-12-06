Meteor.publish("Messages", function () {
  return Messages.find({DeletedAt: {$exists: false}});
});

Meteor.publish("selectedMessages", function () {
  return Messages.find({Selected: true}, {Body: 1});
});

Meteor.publish("Topics", function () {
	return Topics.find({});
});

// Allow users to create questions and 
Messages.allow({
    insert: function (userId,doc) {
      /* user and doc checks ,
      return true to allow insert */
      return true;
    },
    remove: function (userId,doc) {
      if(userId) {
        return true;
      }
    },
    update: function (userId,doc) {
      if(userId) {
        return true;
      }
    }
});

Topics.allow({
	insert: function (userId,doc) {
		if(userId) {
			return true;
		}
	},
	update: function (userId,doc) {
		if(userId) {
			return true;
		}
	}	
});
