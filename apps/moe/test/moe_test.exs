defmodule MoeTest do
  use ExUnit.Case
  doctest Moe

  test "greets the world" do
    assert Moe.hello() == :world
  end
end
