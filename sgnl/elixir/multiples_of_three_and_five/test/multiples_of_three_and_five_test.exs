defmodule MultiplesOfThreeAndFiveTest do
  use ExUnit.Case
  import MultiplesOfThreeAndFive

  test "zero returns zero" do
    assert multi(0) == 0
    assert multi(1) == 0
    assert multi(2) == 0
  end

  test "given 10, returns 23" do
    assert multi(10) == 23
  end

  test "given 1000, returns 23" do
    assert multi(1000) == 233168
  end
end
