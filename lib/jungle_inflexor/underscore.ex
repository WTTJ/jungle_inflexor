defmodule Jungle.Inflexor.Underscore do

  def underscore(atom) when is_atom(atom) do
    case Atom.to_string(atom) do
      "Elixir." <> rest -> underscore(rest)
      string -> underscore(string)
    end
  end

  def underscore(string) when is_binary(string) do
    string
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.replace(~r/([A-Z]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/\W/, "_")
    |> String.downcase
  end
end
