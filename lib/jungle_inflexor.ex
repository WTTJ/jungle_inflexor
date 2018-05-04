defmodule Jungle.Inflexor do
  @moduledoc """
  Documentation for Jungle.Inflexor
  """

  @doc false
  defdelegate parameterize(string), to: Jungle.Inflexor.Parameterize
  defdelegate parameterize(string, option), to: Jungle.Inflexor.Parameterize

  defdelegate ordinalize(nummber), to: Jungle.Inflexor.Ordinalize

  defdelegate underscore(string), to: Jungle.Inflexor.Underscore
  defdelegate dasherize(string), to: Jungle.Inflexor.Dasherize

  defdelegate pluralize(string), to: Jungle.Inflexor.Inflections
  defdelegate singularize(string), to: Jungle.Inflexor.Inflections

end
