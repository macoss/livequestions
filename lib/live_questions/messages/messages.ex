defmodule LiveQuestions.Messages do
  @moduledoc """
  The Messages context.
  """

  import Ecto.Query, warn: false
  alias LiveQuestions.Repo

  alias LiveQuestions.Messages.SmsMsg

  @doc """
  Returns the list of sms_msgs.

  ## Examples

      iex> list_sms_msgs()
      [%SmsMsg{}, ...]

  """
  def list_sms_msgs do
    Repo.all(SmsMsg)
  end

  @doc """
  Gets a single sms_msg.

  Raises `Ecto.NoResultsError` if the Sms msg does not exist.

  ## Examples

      iex> get_sms_msg!(123)
      %SmsMsg{}

      iex> get_sms_msg!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sms_msg!(id), do: Repo.get!(SmsMsg, id)

  @doc """
  Creates a sms_msg.

  ## Examples

      iex> create_sms_msg(%{field: value})
      {:ok, %SmsMsg{}}

      iex> create_sms_msg(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sms_msg(attrs \\ %{}) do
    %SmsMsg{}
    |> SmsMsg.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sms_msg.

  ## Examples

      iex> update_sms_msg(sms_msg, %{field: new_value})
      {:ok, %SmsMsg{}}

      iex> update_sms_msg(sms_msg, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sms_msg(%SmsMsg{} = sms_msg, attrs) do
    sms_msg
    |> SmsMsg.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SmsMsg.

  ## Examples

      iex> delete_sms_msg(sms_msg)
      {:ok, %SmsMsg{}}

      iex> delete_sms_msg(sms_msg)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sms_msg(%SmsMsg{} = sms_msg) do
    Repo.delete(sms_msg)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sms_msg changes.

  ## Examples

      iex> change_sms_msg(sms_msg)
      %Ecto.Changeset{source: %SmsMsg{}}

  """
  def change_sms_msg(%SmsMsg{} = sms_msg) do
    SmsMsg.changeset(sms_msg, %{})
  end
end
