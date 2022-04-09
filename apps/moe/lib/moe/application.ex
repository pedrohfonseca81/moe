defmodule Moe.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Moe.Consumer,
      {Moe.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: Moe.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
