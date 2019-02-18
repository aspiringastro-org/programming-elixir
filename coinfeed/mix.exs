defmodule CoinFeed.MixProject do
  use Mix.Project

  def project do
    [
      app: :coinfeed,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CoinFeed.Application, [env: Mix.env()]},
      applications: applications(Mix.env())
    ]
  end

  # Applications return test dependencies based on mix.env
  defp applications(:test), do: applications(:default) ++ [:cowboy, :plug]
  defp applications(_),     do: [:httpoison]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 0.5.1", only: [:dev], runtime: false},
      {:httpoison, "~> 1.5"},
      {:jason, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 4.0"},
    ]
  end
end
