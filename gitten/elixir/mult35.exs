# sum of multiples of 3 and 5 using list comprehension
# ...because thats all I know how to do

defmodule Mult35 do
  def sum(n \\ 1000) when is_number(n) do
  Enum.sum( for x <- Enum.to_list(0..n-1), rem(x, 3) == 0 || rem(x, 5) == 0, do: x )
  end
end
