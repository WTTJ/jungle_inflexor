defmodule Jungle.Inflexor.Ordinalize do

  @doc """
  Turns a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

  ## Examples

      iex> Jungle.Inflexor.ordinalize(1)
      "1st"

  """
  def ordinalize(number) do
    "#{number}#{ordinal(number)}"
  end

  defp ordinal(number) do
    abs_number = abs(number)

    cond do
      rem(abs_number, 100) in 11..13 -> "th"
      rem(abs_number, 10) == 1 -> "st"
      rem(abs_number, 10) == 2 -> "nd"
      rem(abs_number, 10) == 3 -> "rd"
      true -> "th"
    end
  end

end
