# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :antify,
  ecto_repos: [Antify.Repo]

# Configures the endpoint
config :antify, AntifyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HGV7qlfE9TZoYukPK8nWs5rOl7numJBT4soN/tXzxJgdX4HqgSTc87gjqoqGI3In",
  render_errors: [view: AntifyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Antify.PubSub,
  live_view: [signing_salt: "pJpkK38c"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
