LiveQuestions
=============

LiveQuestions is a [Meteor.js](http://meteor.com) based web application that is designed to take semi-anonymous questions from any users over the web or SMS and then display them on a screen. The application has the ability to edit, approve, reject, and display the questions. Meteor was chosen due to it’s real-time functionality. As messages arrive, all the pages are updated and kept in sync. It is designed to be responsive and function well on mobile and desktop browsers. You can see  a demo of the application at [livequestions.meteor.com](http://livequestions.meteor.com)

The only requirement for LiveQuestions is Meteor and MongoDb.  Meteor has a free hosting solution that has worked well for the events that LiveQuestions has been used for. If you are going to implement text messaging, LiveQuestions has a server side Post URL (/postsms) that supports [Twilio](http://www.twilio.com) API. Just setup a number and point that number’s request URL to http://yoursite.meteor.com/postsms and set the action method in Twilio to HTTP post.  Anything sent to that number other than a few keywords will be treated as a question and posted to the system. A response will be sent back thanking the person for the question.

#### Installation

* Install [Meteor Install](https://www.meteor.com/install)
* Clone this Repository
* Enter the directory you cloned the repository to
* Type: `meteor` to start the local test server
* Open your browser and go to `http://localhost:3000`to test the application

The default user name is admin@livequestions.org and the password is password.  This can be changed using the user interface. If you ‘would like to change the default password when the application is deployed that can be done in the `server/fixtures.js` file.

#### Presenting the Questions
The `/screen` URL is used to display the selected question during the presentation. The default application is to display the question on a black background with the question centered on the screen.  Works well on an iPad connected to a projector or TV. by using the CSS styling or modifying the template you can modify this to look anyway that you would like. Being that Meteor is reactive, when the selective question is changed on the Approved tab it will be automatically updated on all clients viewing `/screen` page.

#### TODOS

* Add a user interface that supports changing the response sent back to the users when adding questions.
* Add a keyword to the PostSmsController that supports returning the current Topic to the user over SMS.
* Create an administrator’s interface that allows authorized users to delete all questions in the database.
* Build an interface that allows administrators to recover deleted questions.