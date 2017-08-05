defmodule LiveQuestions.MessagesTest do
  use LiveQuestions.DataCase

  alias LiveQuestions.Messages

  describe "sms_msgs" do
    alias LiveQuestions.Messages.SmsMsg

    @valid_attrs %{account_sid: "some account_sid", body: "some body", from: "some from", from_city: "some from_city", from_country: "some from_country", from_state: "some from_state", from_zip: "some from_zip", message_sid: "some message_sid", number_media: 42, number_segments: 42, sms_message_sid: "some sms_message_sid", sms_sid: "some sms_sid", sms_status: "some sms_status", to: "some to", to_city: "some to_city", to_country: "some to_country", to_state: "some to_state", to_zip: "some to_zip"}
    @update_attrs %{account_sid: "some updated account_sid", body: "some updated body", from: "some updated from", from_city: "some updated from_city", from_country: "some updated from_country", from_state: "some updated from_state", from_zip: "some updated from_zip", message_sid: "some updated message_sid", number_media: 43, number_segments: 43, sms_message_sid: "some updated sms_message_sid", sms_sid: "some updated sms_sid", sms_status: "some updated sms_status", to: "some updated to", to_city: "some updated to_city", to_country: "some updated to_country", to_state: "some updated to_state", to_zip: "some updated to_zip"}
    @invalid_attrs %{account_sid: nil, body: nil, from: nil, from_city: nil, from_country: nil, from_state: nil, from_zip: nil, message_sid: nil, number_media: nil, number_segments: nil, sms_message_sid: nil, sms_sid: nil, sms_status: nil, to: nil, to_city: nil, to_country: nil, to_state: nil, to_zip: nil}

    def sms_msg_fixture(attrs \\ %{}) do
      {:ok, sms_msg} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messages.create_sms_msg()

      sms_msg
    end

    test "list_sms_msgs/0 returns all sms_msgs" do
      sms_msg = sms_msg_fixture()
      assert Messages.list_sms_msgs() == [sms_msg]
    end

    test "get_sms_msg!/1 returns the sms_msg with given id" do
      sms_msg = sms_msg_fixture()
      assert Messages.get_sms_msg!(sms_msg.id) == sms_msg
    end

    test "create_sms_msg/1 with valid data creates a sms_msg" do
      assert {:ok, %SmsMsg{} = sms_msg} = Messages.create_sms_msg(@valid_attrs)
      assert sms_msg.account_sid == "some account_sid"
      assert sms_msg.body == "some body"
      assert sms_msg.from == "some from"
      assert sms_msg.from_city == "some from_city"
      assert sms_msg.from_country == "some from_country"
      assert sms_msg.from_state == "some from_state"
      assert sms_msg.from_zip == "some from_zip"
      assert sms_msg.message_sid == "some message_sid"
      assert sms_msg.number_media == 42
      assert sms_msg.number_segments == 42
      assert sms_msg.sms_message_sid == "some sms_message_sid"
      assert sms_msg.sms_sid == "some sms_sid"
      assert sms_msg.sms_status == "some sms_status"
      assert sms_msg.to == "some to"
      assert sms_msg.to_city == "some to_city"
      assert sms_msg.to_country == "some to_country"
      assert sms_msg.to_state == "some to_state"
      assert sms_msg.to_zip == "some to_zip"
    end

    test "create_sms_msg/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_sms_msg(@invalid_attrs)
    end

    test "update_sms_msg/2 with valid data updates the sms_msg" do
      sms_msg = sms_msg_fixture()
      assert {:ok, sms_msg} = Messages.update_sms_msg(sms_msg, @update_attrs)
      assert %SmsMsg{} = sms_msg
      assert sms_msg.account_sid == "some updated account_sid"
      assert sms_msg.body == "some updated body"
      assert sms_msg.from == "some updated from"
      assert sms_msg.from_city == "some updated from_city"
      assert sms_msg.from_country == "some updated from_country"
      assert sms_msg.from_state == "some updated from_state"
      assert sms_msg.from_zip == "some updated from_zip"
      assert sms_msg.message_sid == "some updated message_sid"
      assert sms_msg.number_media == 43
      assert sms_msg.number_segments == 43
      assert sms_msg.sms_message_sid == "some updated sms_message_sid"
      assert sms_msg.sms_sid == "some updated sms_sid"
      assert sms_msg.sms_status == "some updated sms_status"
      assert sms_msg.to == "some updated to"
      assert sms_msg.to_city == "some updated to_city"
      assert sms_msg.to_country == "some updated to_country"
      assert sms_msg.to_state == "some updated to_state"
      assert sms_msg.to_zip == "some updated to_zip"
    end

    test "update_sms_msg/2 with invalid data returns error changeset" do
      sms_msg = sms_msg_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_sms_msg(sms_msg, @invalid_attrs)
      assert sms_msg == Messages.get_sms_msg!(sms_msg.id)
    end

    test "delete_sms_msg/1 deletes the sms_msg" do
      sms_msg = sms_msg_fixture()
      assert {:ok, %SmsMsg{}} = Messages.delete_sms_msg(sms_msg)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_sms_msg!(sms_msg.id) end
    end

    test "change_sms_msg/1 returns a sms_msg changeset" do
      sms_msg = sms_msg_fixture()
      assert %Ecto.Changeset{} = Messages.change_sms_msg(sms_msg)
    end
  end
end
