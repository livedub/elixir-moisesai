defmodule MoisesAITest do
  use ExUnit.Case
  doctest MoisesAI

  test "create one signal structure" do
    assert %{} = MoisesAI.new
  end

end
