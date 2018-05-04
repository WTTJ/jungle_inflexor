defmodule Jungle.Inflexor.Dasherize do

  @doc """
  Replaces underscores with dashes in the string.

  ## Examples

      iex> Jungle.Inflexor.dasherize("one_big_slug")
      "one-big-slug"

  """
  def dasherize(string) do
    string
    |> String.replace(~r/_/, "-")
  end
end
