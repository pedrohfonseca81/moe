import Config

config :dashboard,
  ecto_repos: [Dashboard.Repo],
  generators: [context_app: false]

# Configures the endpoint
config :dashboard, Dashboard.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: Dashboard.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Dashboard.PubSub,
  live_view: [signing_salt: "e6mv+4U7"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/dashboard/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :moe, Moe.Repo,
  database: "moe",
  username: "moe",
  password: "moe123",
  hostname: "localhost"

config :moe,
  ecto_repos: [Moe.Repo]

config :nostrum,
  token: "token",
  gateway_intents: :all

config :gettext, :default_locale, "en_US"
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
