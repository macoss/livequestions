# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :live_questions,
  ecto_repos: [LiveQuestions.Repo]

# Configures the endpoint
config :live_questions, LiveQuestionsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jrIrs6Li/gvZLZ18fYlEEVdqggQieYy1XCw64yXdPTGwNVe7JH6ucKt0EiVuMCNN",
  render_errors: [view: LiveQuestionsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveQuestions.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
