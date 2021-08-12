# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :politicians,
  ecto_repos: [Politicians.Repo]

# Configures the endpoint
config :politicians, PoliticiansWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "A+J1xwcm4srN5HwHhvu11lObyA5s2irldoF0GZp88ezeunCz46KQTXMh7CrFO1wF",
  render_errors: [view: PoliticiansWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Politicians.PubSub,
  live_view: [signing_salt: "T7hpp2ey"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
