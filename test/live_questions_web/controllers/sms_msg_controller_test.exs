defmodule LiveQuestionsWeb.SmsMsgControllerTest do
  use LiveQuestionsWeb.ConnCase

  alias LiveQuestions.Messages

  @create_attrs %{account_sid: "some account_sid", body: "some body", from: "some from", from_city: "some from_city", from_country: "some from_country", from_state: "some from_state", from_zip: "some from_zip", message_sid: "some message_sid", number_media: 42, number_segments: 42, sms_message_sid: "some sms_message_sid", sms_sid: "some sms_sid", sms_status: "some sms_status", to: "some to", to_city: "some to_city", to_country: "some to_country", to_state: "some to_state", to_zip: "some to_zip"}
  @update_attrs %{account_sid: "some updated account_sid", body: "some updated body", from: "some updated from", from_city: "some updated from_city", from_country: "some updated from_country", from_state: "some updated from_state", from_zip: "some updated from_zip", message_sid: "some updated message_sid", number_media: 43, number_segments: 43, sms_message_sid: "some updated sms_message_sid", sms_sid: "some updated sms_sid", sms_status: "some updated sms_status", to: "some updated to", to_city: "some updated to_city", to_country: "some updated to_country", to_state: "some updated to_state", to_zip: "some updated to_zip"}
  @invalid_attrs %{account_sid: nil, body: nil, from: nil, from_city: nil, from_country: nil, from_state: nil, from_zip: nil, message_sid: nil, number_media: nil, number_segments: nil, sms_message_sid: nil, sms_sid: nil, sms_status: nil, to: nil, to_city: nil, to_country: nil, to_state: nil, to_zip: nil}

  def fixture(:sms_msg) do
    {:ok, sms_msg} = Messages.create_sms_msg(@create_attrs)
    sms_msg
  end

  describe "index" do
    test "lists all sms_msgs", %{conn: conn} do
      conn = get conn, sms_msg_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Sms msgs"
    end
  end

  describe "new sms_msg" do
    test "renders form", %{conn: conn} do
      conn = get conn, sms_msg_path(conn, :new)
      assert html_response(conn, 200) =~ "New Sms msg"
    end
  end

  describe "create sms_msg" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, sms_msg_path(conn, :create), sms_msg: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == sms_msg_path(conn, :show, id)

      conn = get conn, sms_msg_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Sms msg"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, sms_msg_path(conn, :create), sms_msg: @invalid_attrs
      assert html_response(conn, 200) =~ "New Sms msg"
    end
  end

  describe "edit sms_msg" do
    setup [:create_sms_msg]

    test "renders form for editing chosen sms_msg", %{conn: conn, sms_msg: sms_msg} do
      conn = get conn, sms_msg_path(conn, :edit, sms_msg)
      assert html_response(conn, 200) =~ "Edit Sms msg"
    end
  end

  describe "update sms_msg" do
    setup [:create_sms_msg]

    test "redirects when data is valid", %{conn: conn, sms_msg: sms_msg} do
      conn = put conn, sms_msg_path(conn, :update, sms_msg), sms_msg: @update_attrs
      assert redirected_to(conn) == sms_msg_path(conn, :show, sms_msg)

      conn = get conn, sms_msg_path(conn, :show, sms_msg)
      assert html_response(conn, 200) =~ "some updated account_sid"
    end

    test "renders errors when data is invalid", %{conn: conn, sms_msg: sms_msg} do
      conn = put conn, sms_msg_path(conn, :update, sms_msg), sms_msg: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Sms msg"
    end
  end

  describe "delete sms_msg" do
    setup [:create_sms_msg]

    test "deletes chosen sms_msg", %{conn: conn, sms_msg: sms_msg} do
      conn = delete conn, sms_msg_path(conn, :delete, sms_msg)
      assert redirected_to(conn) == sms_msg_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, sms_msg_path(conn, :show, sms_msg)
      end
    end
  end

  defp create_sms_msg(_) do
    sms_msg = fixture(:sms_msg)
    {:ok, sms_msg: sms_msg}
  end
end
