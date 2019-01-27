defmodule Exercise1 do
  @moduledoc """
  Documentation for Exercise1.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Exercise1.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """

      iex> Exercise1.list_concat([1,2,3], [4,5,6])
      [1,2,3,4,5,6]
  
  """
  def list_concat(list1, list2) do
    # list1 ++ list2
    list_concat(list1, list2, [])
  end

  defp list_concat([item | rest], list2, acc) do
    IO.inspect(%{item: item, rest: rest, list2: list2, acc: acc}, label: "pre-one")
    list_concat(rest, list2, [item | acc])
    |> IO.inspect(label: "one")
  end

  defp list_concat([], [item | rest], acc) do
    IO.inspect(%{item: item, rest: rest, acc: acc}, label: "pre-two")
    list_concat([], rest, [item | acc])
    |> IO.inspect(label: "two")
  end

  defp list_concat([], [], acc) do
    IO.inspect(%{acc: acc}, label: "pre-final")
    acc
    |> Enum.reverse
    |> IO.inspect(label: "final")
  end
end
