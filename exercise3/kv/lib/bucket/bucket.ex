defmodule KV.Bucket do
  use Agent

  @moduledoc """
  Documentation for KV.
  """

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Get a `value` from the `key` in the `bucket`

  ## Examples

      iex> bucket = KV.Bucket.start_link()
      iex> KV.Bucket.put(bucket, :foo, "bar")
      iex> KV.Bucket.get(bucket, :foo)
      "bar"

  """
  def get(bucket, key) do
    Agent.get(bucket, fn map -> Map.get(map, key) end)
  end

  @doc """
  Put the `value` for the given `key` in the specified `bucket`

  ## Examples

      iex> bucket = KV.Bucket.start_link()
      iex> KV.Bucket.put(bucket, :foo, "bar")
      iex> KV.Bucket.get(bucket, :foo)
      "bar"

  """
  def put(bucket, key, value) do
    Agent.update(bucket, fn map -> Map.put(map, key, value) end)
  end

  @doc """
  Delete the specified `key` in the provided `bucket` and return its
  previous `value`


  ## Examples

      iex> bucket = KV.Bucket.start_link()
      iex> KV.Bucket.put(bucket, :foo, "bar")
      iex> KV.Bucket.delete(bucket, :foo)
      "bar"
      iex> KV.Bucket.delete(bucket, :foo)
      nil
      
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn map -> Map.pop(map, key) end)
  end
end
