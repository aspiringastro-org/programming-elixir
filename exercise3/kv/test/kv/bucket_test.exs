defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket, pid: self()}
  end

  test "store values by key", %{bucket: bucket, pid: test_pid} do
    IO.puts("Running test with bucket process #{inspect(bucket)} from test process #{inspect(test_pid)}, self: #{inspect self()}")
    assert KV.Bucket.get(bucket, "foo") == nil

    KV.Bucket.put(bucket, "foo", 3)
    assert KV.Bucket.get(bucket, "foo") == 3
  end

  test "delete a key", %{bucket: bucket, pid: _pid} do
    KV.Bucket.put(bucket, "key_to_be_deleted", 0)
    assert KV.Bucket.get(bucket, "key_to_be_deleted") == 0
    assert KV.Bucket.delete(bucket, "key_to_be_deleted") == 0
    assert KV.Bucket.get(bucket, "key_to_be_deleted") == nil
  end
end
