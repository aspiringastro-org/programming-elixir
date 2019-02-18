defmodule CoinFeed.MockServer do
    @moduledoc """
    Mock implementation of CoinData feed
    """
    use Plug.Router

    plug Plug.Parsers, parsers: [:json],
                    pass: ["text/*"],
                    json_decoder: Poison

    plug :match
    plug :dispatch

    # Test Routes
    get "/page/BTC" do
        IO.inspect conn.params, label: "conn params"
        success(conn,
        %{
            "_id" => "179bd7dc-72b3-4eee-b373-e719a9489ed9",
            "altCap" => 57917318737.33578,
            "alt_name" => "bitcoin",
            "bitnodesCount" => 10579,
            "btcCap" => 63905775900.141136,
            "btcPrice" => 3643.12961,
            "cap24hrChange" => 0.51,
            "display_name" => "Bitcoin",
            "dom" => 57.62,
            "id" => "BTC",
            "market_cap" => 63905775900.141136,
            "price" => 3643.12961016,
            "price_btc" => 1,
            "price_eth" => 29.516816921931078,
            "price_eur" => 3202.107890998965,
            "price_ltc" => 83.08855240099045,
            "price_usd" => 3643.12961,
            "price_zec" => 70.58858668647628,
            "rank" => 1,
            "status" => "available",
            "supply" => 17541450,
            "totalCap" => 121823094637.47687,
            "type" => "cmc",
            "volume" => 5782842198.76,
            "volumeAlt" => 89407895.78867821,
            "volumeBtc" => 121582952.20279162,
            "volumeTotal" => 210990847.99146983,
            "vwap_h24" => 3671.967626135315
          })
    end

    # Test unknown crypto coin
    get "/page/UNKNOWN" do
        failure(conn)
    end


    defp success(conn, body \\ "") do
        conn
        |> Plug.Conn.send_resp(200, Poison.encode!(body))
    end

    defp failure(conn) do
        conn
        |> Plug.Conn.send_resp(400, Poison.encode!(%{message: "not found"}))
    end

end