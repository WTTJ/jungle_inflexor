defmodule Jungle.Inflexor.Humanizations do
  require Jungle.Inflexor.Constants
  alias Jungle.Inflexor.Constants

  @doc """
    # Tweaks an attribute name for display to end users.
    #
    # Specifically, performs these transformations:
    #
    # * Applies human inflection rules to the argument.
    # * Deletes leading underscores, if any.
    # * Removes a "_id" suffix if present.
    # * Replaces underscores with spaces, if any.
    # * Downcases all words except acronyms.
    # * Capitalizes the first word.
    # The capitalization of the first word can be turned off by setting the
    # +:capitalize+ option to false (default is true).
    #
    # The trailing '_id' can be kept and capitalized by setting the
    # optional parameter +keep_id_suffix+ to true (default is false).

  ## Examples

      iex> Jungle.Inflexor.humanize("employee_salary")
      "Employee salary"
      iex> Jungle.Inflexor.humanize("author_id")
      "Author"
      iex> Jungle.Inflexor.humanize("author_id", [capitalize: false])
      "author"
      iex> Jungle.Inflexor.humanize("_id")
      "Id"
      iex> Jungle.Inflexor.humanize("author_id", [keep_id_suffix: true])
      "Author Id"

    # If "SSL" was defined to be an acronym:
      iex> Jungle.Inflexor.humanize("ssl_error")
      "SSL error"
  """
  def humanize(string, opts \\ []) do
    cond do
      byte_size(string) == 0 -> string
      true ->
        string
        |> replace_humanizeable
        |> clear_special_characters(opts)
        |> capitalize(opts)
        |> replace_acronyms
    end
  end

  defp replace_humanizeable(string) do
    case Enum.find(Constants.humans, nil, fn {regex, _} -> Regex.match?(regex,string) end ) do
      nil -> string
      {regex, repl} -> Regex.replace(regex, string, repl)
    end
  end

  defp clear_special_characters(string, opts \\ []) do
    case opts[:keep_id_suffix] do
      nil ->
        string
        |> String.replace(~r/\A_+/, "")
        |> String.replace(~r/_id\z/, "")
        |> String.replace(~r/_/, " ")
      true ->
        string
        |> String.replace(~r/\A_+/, "")
        |> String.replace(~r/_/, " ")
    end
  end

  defp replace_acronyms(string) do
    string
    |> (&Regex.replace(~r/([a-z\d]*)/i, &1, fn(word) ->
      case Enum.find(Constants.acronyms, nil, fn (term) -> Regex.match?(~r/#{term}/i, word) end ) do
        nil -> word
        term -> term
      end
    end)).()
  end

  defp capitalize(string, opts \\ []) do
    case opts[:capitalize] do
      false -> string
      _ ->
        string
        |> String.capitalize
    end
  end

  defp acronym_regex do
    Constants.acronyms
    |> Enum.join("|")
    |> Regex.compile
  end

  @doc """
    # Capitalizes all the words and replaces some characters in the string to
    # create a nicer looking title. +titleize+ is meant for creating pretty
    # output. It is not used in the Rails internals.
    #
    # The trailing '_id','Id'.. can be kept and capitalized by setting the
    # optional parameter +keep_id_suffix+ to true.
    # By default, this parameter is false.
    #
    # +titleize+ is also aliased as +titlecase+.
    #
    #   titleize('man from the boondocks')                       # => "Man From The Boondocks"
    #   titleize('x-men: the last stand')                        # => "X Men: The Last Stand"
    #   titleize('TheManWithoutAPast')                           # => "The Man Without A Past"
    #   titleize('raiders_of_the_lost_ark')                      # => "Raiders Of The Lost Ark"
    #   titleize('string_ending_with_id', keep_id_suffix: true)  # => "String Ending With Id"
  ## Examples

      iex> Jungle.Inflexor.titleize("man from the boondocks")
      "man from the boondocks"
      iex> Jungle.Inflexor.titleize("x-men: the last stand")
      "X Men: The Last Stand"
      iex> Jungle.Inflexor.titleize("TheManWithoutAPast")
      "The Man Without A Past"
      iex> Jungle.Inflexor.titleize("raiders_of_the_lost_ark")
      "Raiders Of The Lost Ark"
      iex> Jungle.Inflexor.titleize("string_ending_with_id", [keep_id_suffix: true])
      "String Ending With Id"
  """
  def titleize(string, opts \\ []) do
    string
    |> Jungle.Inflexor.Underscore.underscore
    |> humanize(opts)
    |> (&Regex.replace(~r/\b(?<!\w['’`])[a-z]/, &1, fn(word) ->
      String.capitalize(word)
    end)).()
  end
end
