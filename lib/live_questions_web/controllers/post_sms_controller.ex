defmodule LiveQuestionsWeb.PostSmsController do
  use LiveQuestionsWeb, :controller

  alias LiveQuestions.Messages

  def postsms(conn, sms_params) do
    # Log the message to the database.
    case log_sms(sms_params) do
    {:ok, sms_message} ->
      # Was a keyword sent?
      if 1 === sms_message.body |> String.split |> length do
        # We have a keyword
        process_keyword(conn, sms_message)
      else # This was not a keyword so we will process it as a question.
        process_question(conn)
      end

      {:error, msg} ->
        sms_err_response(conn, msg)
    end
  end

  def log_sms(sms_params) do

    # Log the message to the database.
    sms_post = %{
      account_sid: sms_params["AccountSid"],
      body: sms_params["Body"],
      from: sms_params["From"],
      from_city: sms_params["FromCity"],
      from_country: sms_params["FromCountry"],
      from_state: sms_params["FromState"],
      from_zip: sms_params["FromZip"],
      message_sid: sms_params["MessageSid"],
      number_media: sms_params["NumMedia"],
      number_segments: sms_params["NumSegments"],
      sms_message_sid: sms_params["SmsMessageSid"],
      sms_sid: sms_params["SmsSid"],
      sms_status: sms_params["SmsStatus"],
      to: sms_params["To"],
      to_city: sms_params["ToCity"],
      to_country: sms_params["ToCountry"],
      to_state: sms_params["ToState"],
      to_zip: sms_params["ToZip"]
    }

    case Messages.create_sms_msg(sms_post) do
      {:ok, sms_message} ->
        {:ok, sms_message}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:error, "SMS message was not formated correctly"}
    end
  end

  def process_keyword(conn, sms_message) do
    case String.downcase(sms_message.body) do
      "topic" ->
        sms_response(conn, "I really don't know at this point")
    end
  end

  def process_question(conn) do
    sms_response(conn, "Thanks for your question!")
  end

  def sms_response(conn, msg) do
    conn
    |> put_resp_content_type("text/xml")
    |> send_resp(200, "<Response><Message>#{msg}</Message></Response>")
  end

  def sms_err_response(conn, msg) do
    conn
    |> put_resp_content_type("text/xml")
    |> send_resp(400, "<Response><Message>#{msg}</Message></Response>")
  end

end
