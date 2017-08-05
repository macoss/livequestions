defmodule LiveQuestions.Repo.Migrations.CreateSmsMsgs do
  use Ecto.Migration

  def change do
    create table(:sms_msgs) do
      add :account_sid, :string
      add :body, :text
      add :from, :string
      add :from_city, :string
      add :from_country, :string
      add :from_state, :string
      add :from_zip, :string
      add :message_sid, :string
      add :number_media, :integer
      add :number_segments, :integer
      add :sms_message_sid, :string
      add :sms_sid, :string
      add :sms_status, :string
      add :to, :string
      add :to_city, :string
      add :to_country, :string
      add :to_state, :string
      add :to_zip, :string

      timestamps()
    end

  end
end
