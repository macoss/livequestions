defmodule LiveQuestions.Messages.SmsMsg do
  use Ecto.Schema
  import Ecto.Changeset
  alias LiveQuestions.Messages.SmsMsg


  schema "sms_msgs" do
    field :account_sid, :string
    field :body, :string
    field :from, :string
    field :from_city, :string
    field :from_country, :string
    field :from_state, :string
    field :from_zip, :string
    field :message_sid, :string
    field :number_media, :integer
    field :number_segments, :integer
    field :sms_message_sid, :string
    field :sms_sid, :string
    field :sms_status, :string
    field :to, :string
    field :to_city, :string
    field :to_country, :string
    field :to_state, :string
    field :to_zip, :string

    timestamps()
  end

  @doc false
  def changeset(%SmsMsg{} = sms_msg, attrs) do
    sms_msg
    |> cast(attrs, [:account_sid, :body, :from, :from_city, :from_country, :from_state, :from_zip, :message_sid, :number_media, :number_segments, :sms_message_sid, :sms_sid, :sms_status, :to, :to_city, :to_country, :to_state, :to_zip])
    |> validate_required([:account_sid, :body, :from, :from_city, :from_country, :from_state, :from_zip, :message_sid, :number_media, :number_segments, :sms_message_sid, :sms_sid, :sms_status, :to, :to_city, :to_country, :to_state, :to_zip])
  end
end
