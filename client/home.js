Template.addQuestion.events({
  'click #add-question': function () {
    var new_question = document.getElementById("question").value;
    var now = new Date();
    Messages.insert({
      Body: new_question,
      Approved: false,
      CreatedAt: now.valueOf()
    });
    document.getElementById("question").value = "";
    window.alert("Thank you for submitting your question.");
  }
});
      
