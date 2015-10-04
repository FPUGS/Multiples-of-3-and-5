defmodule MultiplesOfThreeAndFive do

  def multi(n) do
    cond do
      # return zero if given a number less than 3
      n < 3 ->
        0
      true ->
        # cast n to list and use Enum.reduce
        Enum.reduce(Enum.to_list(1 .. n - 1 ), 0,
          fn(x, acc) ->
            if rem(x, 3) == 0 || rem(x, 5) == 0, do: x + acc, else: acc
          end
        )
    end
  end

end
