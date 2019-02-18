defmodule CoinFeed.Data do
    @moduledoc """
    CoinFeed.Data queries the coincap.io data feed to
    fetch crypto currencies price feed.
    """

    @base_url Application.get_env(:coinfeed, :api_base_url)
    @doc """
    
    """
    def fetch(id) when is_atom(id) do
        response = coin_url(id)
                    |> HTTPoison.get!
        response.body
        |> Jason.decode!
    end

    defp coin_url(id) do
        coin_id = id
            |> Atom.to_string
            |> String.upcase
         @base_url <> "/page/#{coin_id}"
    end
end