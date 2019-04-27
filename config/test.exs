use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pets, PetsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pets, Pets.Repo,
  username: "enrique",
  password: "postgres",
  database: "pets_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
