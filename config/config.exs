# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :finance,
  ecto_repos: [Finance.Repo]

# Configures the endpoint
config :finance, FinanceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xyzTVyV7OXjNCOGGZaBh+dguHxiUjffwmncV5k0/fD9pF8OpcuRw5VUyWBZ9vqoX",
  render_errors: [view: FinanceWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Finance.PubSub,
  live_view: [signing_salt: "Y5uDm3Gi"]

config :finance, Finance.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :finance, :basic_auth,
  username: "admin",
  password: "123456"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
