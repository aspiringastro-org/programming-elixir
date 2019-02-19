defmodule Exercise2Test do
  use ExUnit.Case
  doctest Exercise2

  test "greets the world" do
    assert Exercise2.hello() == :world
  end
end
