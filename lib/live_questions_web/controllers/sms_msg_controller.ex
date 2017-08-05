defmodule LiveQuestionsWeb.SmsMsgController do
  use LiveQuestionsWeb, :controller

  alias LiveQuestions.Messages
  alias LiveQuestions.Messages.SmsMsg

  def index(conn, _params) do
    sms_msgs = Messages.list_sms_msgs()
    render(conn, "index.html", sms_msgs: sms_msgs)
  end

  def new(conn, _params) do
    changeset = Messages.change_sms_msg(%SmsMsg{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sms_msg" => sms_msg_params}) do
    case Messages.create_sms_msg(sms_msg_params) do
      {:ok, sms_msg} ->
        conn
        |> put_flash(:info, "Sms msg created successfully.")
        |> redirect(to: sms_msg_path(conn, :show, sms_msg))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sms_msg = Messages.get_sms_msg!(id)
    render(conn, "show.html", sms_msg: sms_msg)
  end

  def edit(conn, %{"id" => id}) do
    sms_msg = Messages.get_sms_msg!(id)
    changeset = Messages.change_sms_msg(sms_msg)
    render(conn, "edit.html", sms_msg: sms_msg, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sms_msg" => sms_msg_params}) do
    sms_msg = Messages.get_sms_msg!(id)

    case Messages.update_sms_msg(sms_msg, sms_msg_params) do
      {:ok, sms_msg} ->
        conn
        |> put_flash(:info, "Sms msg updated successfully.")
        |> redirect(to: sms_msg_path(conn, :show, sms_msg))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sms_msg: sms_msg, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sms_msg = Messages.get_sms_msg!(id)
    {:ok, _sms_msg} = Messages.delete_sms_msg(sms_msg)

    conn
    |> put_flash(:info, "Sms msg deleted successfully.")
    |> redirect(to: sms_msg_path(conn, :index))
  end
end
