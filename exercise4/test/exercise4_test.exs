defmodule Exercise4Test do
  use ExUnit.Case
  doctest Exercise4

  test "greets the world" do
    assert Exercise4.hello() == :world
  end
end
