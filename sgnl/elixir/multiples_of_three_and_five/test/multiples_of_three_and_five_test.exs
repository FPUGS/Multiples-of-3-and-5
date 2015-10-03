defmodule MultiplesOfThreeAndFiveTest do
  use ExUnit.Case
  import MultiplesOfThreeAndFive

  test "zero returns zero" do
    assert multi(0) == 0
    assert multi(1) == 0
    assert multi(2) == 0
  end
end
