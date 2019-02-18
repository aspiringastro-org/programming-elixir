defmodule CoinFeed.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, args) do
    # List all child processes to be supervised
    children = case args do
      [env: :prod] -> []
      [env: :test] -> [
        {
          Plug.Cowboy, 
          scheme: :http, 
          plug: CoinFeed.MockServer, 
          options: [port: 8081]
        }]
      [env: :dev] -> []
      [_] -> []
    end

    # [
    #   # Starts a worker by calling: CoinFeed.Worker.start_link(arg)
    #   # {CoinFeed.Worker, arg},
    # ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CoinFeed.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
