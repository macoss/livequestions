defmodule LiveQuestionsWeb.PageController do
  use LiveQuestionsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
