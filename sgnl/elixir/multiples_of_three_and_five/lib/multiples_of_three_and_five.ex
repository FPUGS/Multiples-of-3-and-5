defmodule MultiplesOfThreeAndFive do

  def multi(n) do
    cond do
      # return zero if given a number less than 3
      n < 3 ->
        0
      true ->
        # cast n to list and recurse with 0 as initial accumulator value
        multi(Enum.to_list(1 .. n - 1 ), 0)
    end
  end

  # base case, if given an empty list, return the accumulator
  def multi([], sum), do: sum

  # check for multiple of 3, recurse
  def multi([first|rest], sum) do
    cond do
      rem(first, 3) == 0 ->
        multi(rest, first + sum)
      rem(first, 5) == 0 ->
        multi(rest, first + sum)
      true ->
        multi(rest, sum)
    end
  end

end
