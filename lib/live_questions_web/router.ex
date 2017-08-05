defmodule LiveQuestionsWeb.Router do
  use LiveQuestionsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :twilio do
    plug :accepts, ["html"]
  end

  scope "/", LiveQuestionsWeb do
    pipe_through :browser # Use the default browser stack
    
    resources "/sms_msgs", SmsMsgController

    get "/", PageController, :index
  end

  scope "/twilio", LiveQuestionsWeb do
    pipe_through :twilio

    post "/postsms", PostSmsController, :postsms
  end


  # Other scopes may use custom stacks.
  # scope "/api", LiveQuestionsWeb do
  #   pipe_through :api
  # end
end
