defmodule Jungle.Inflexor.Inflections do
  require Jungle.Inflexor.Constants
  alias Jungle.Inflexor.Constants

  @doc """
  Returns the plural form of the word in the string.

  ## Examples

      iex> Jungle.Inflexor.pluralize("movie")
      "movies"

  """
  def pluralize(string, locale \\ "en") do
    apply_inflections(string, plural_expressions)
  end

  @doc """
  The reverse of `pluralize`:w, returns the singular form of a word in a string.

  ## Examples

      iex> Jungle.Inflexor.singularize("quizzes")
      "quiz"

  """
  def singularize(string, locale \\ "en") do
    apply_inflections(string, singular_expressions)
  end

  defp singular_expressions do
    Application.get_env(:jungle_inflexor, :singular, []) ++ Constants.singular ++ Constants.irregular
  end

  defp plural_expressions do
    Application.get_env(:ungle_inflexor, :plural, []) ++ Constants.plural ++ Constants.plural_irregular
  end

  defp uncountable_expressions do
    Application.get_env(:jungle_inflexor, :uncountable, []) ++ Constants.uncountable
  end

  defp apply_inflections(string, rules) do
    cond do
      byte_size(string) == 0 -> string
      is_uncountable?(string) -> string
      true ->
        case Enum.find(rules, nil, fn {regex, _} -> Regex.match?(regex,string) end ) do
          nil -> string
          {regex,repl} -> Regex.replace(regex, string, repl)
        end
    end
  end

  defp is_uncountable?(string, list \\ uncountable_expressions) do
    case Enum.find(list ,fn (regex) ->
      Regex.match?(~r/(?i)(^(?:.*#{regex}))$/, string)
    end) do
      nil -> false
      _ -> true
    end
  end

end
