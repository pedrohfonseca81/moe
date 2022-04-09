defmodule Moe.MixProject do
  use Mix.Project

  def project do
    [
      app: :moe,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      compilers: [:gettext] ++ Mix.compilers(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Moe.Application, []}
    ]
  end

  defp deps do
    [
      {:nostrum, github: "Kraigie/nostrum"},
      {:gettext, "~> 0.19.1"},
      {:ecto, "~> 3.7"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
