PostSmsController = RouteController.extend({
  action: function() {
    var params = this.request.body;
    var Body, FromCity, FromState, FromZip, FromCountry, ToCity, ToState, ToCountry;

    if(params.Body) {

      //Is this an additional message in a chain of messages?
      var now = new Date(); // get the current time
      var seconds = now.getSeconds(); // get the seconds from the current time
      now.setSeconds(seconds - 10); // subtract 10 seconds from the current time

      var FirstMsg = Messages.findOne({From: params.From, CreatedAt: {$gt: now.valueOf()}}, {sort: {CreatedAt: -1}});

      // Clean up the text
      Body = decodeURIComponent((params.Body).replace(/\+/g, '%20'));
      FromCity = decodeURIComponent((params.FromCity).replace(/\+/g, '%20'));
      FromState = decodeURIComponent((params.FromState).replace(/\+/g, '%20'));
      FromZip = decodeURIComponent((params.FromZip).replace(/\+/g, '%20'));
      FromCountry = decodeURIComponent((params.FromCountry).replace(/\+/g, '%20'));
      ToCity = decodeURIComponent((params.ToCity).replace(/\+/g, '%20'));
      ToState = decodeURIComponent((params.ToState).replace(/\+/g, '%20'));
      ToCountry = decodeURIComponent((params.ToCountry).replace(/\+/g, '%20'));


      if(!FirstMsg)
      {
        // Save to the database
        now = new Date();

        Messages.insert({
          MessageSid: params.MessageSid,
          AccountSid: params.AccountSid,
          From: params.From,
          To: params.To,
          Body: Body,
          FromCity: FromCity,
          FromState: FromState,
          FromZip: FromZip,
          FromCountry: FromCountry,
          ToCity: ToCity,
          ToState: ToState,
          ToCountry: ToCountry,
          Approved: false,
          CreatedAt: now.valueOf()
        });

        console.log('New Message - ID: ' + params.MessageSid + " Body: " + Body + ' CreatedAt: ' + now);
        
        this.response.writeHead(200, {'Content-Type': 'text/xml'});
        this.response.end('<Response><Message>Thanks for your question!</Message></Response>');

      } else {
        Body = FirstMsg.Body + Body;
        Messages.update(FirstMsg, {$set: {Body: Body}});

        console.log('Added to the body of message: ' + params.MessageSid);
        
        this.response.writeHead(200);
      }
    } else {
      console.log('No data sent');
      this.response.writeHead(400);
    }
  }
});
