Template.addQuestion.events({
  'click #add-question': function () {
  var new_question = document.getElementById("question").value;
  var now = new Date();
  
  if(new_question) {
    Messages.insert({
      Body: new_question,
      Approved: false,
      CreatedAt: now.valueOf()
    });
    document.getElementById("question").value = "";
    Notifications.success("Thank You", "Your Question has been submitted");
  } else {
    Notifications.error("Error", "The question can not be blank");
  }
}
});
