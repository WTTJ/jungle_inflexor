defmodule Jungle.Inflexor.Ordinalize do

  def ordinal(number) do
    abs_number = abs(number)

    cond do
      rem(abs_number, 100) in 11..13 -> "th"
      rem(abs_number, 10) == 1 -> "st"
      rem(abs_number, 10) == 2 -> "nd"
      rem(abs_number, 10) == 3 -> "rd"
      true -> "th"
    end
  end

  def ordinalize(number) do
    "#{number}#{ordinal(number)}"
  end
end
