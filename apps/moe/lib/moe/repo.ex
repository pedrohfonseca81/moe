defmodule Moe.Repo do
  use Ecto.Repo,
    otp_app: :moe,
    adapter: Ecto.Adapters.Postgres
end
