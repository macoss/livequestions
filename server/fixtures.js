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
