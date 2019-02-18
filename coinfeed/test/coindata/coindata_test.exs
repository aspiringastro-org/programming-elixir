defmodule CoinFeed.Test do
    use ExUnit.Case, async: false

    test "fetch BTC price" do
        data = CoinFeed.Data.fetch(:btc)
        IO.inspect data, label: "mock btc"
        assert data["id"] == "BTC"
        assert data["price_btc"] == 1
    end
end