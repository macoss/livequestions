if ( Meteor.users.find().count() === 0 ) {
  Accounts.createUser({
    username: 'admin',
    email: 'admin@livequestions.org',
    password: 'password',
    profile: {
        first_name: 'Admin',
        last_name: 'Questions',
    }
  });
}

if ( Topics.find().count() === 0 ) {
	Topics.insert({Body: "Ask us about the Live Questions app"});
}
