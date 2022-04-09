import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dashboard, Dashboard.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "4qC1Hyj+hHChMbTO3aX+yaJLfAVXBvXDzCkhvyj/tPbpnoKz9Dqh4fXrOEHJeCTs",
  server: false
