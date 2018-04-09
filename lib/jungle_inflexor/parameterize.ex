defmodule Jungle.Inflexor.Parameterize do

  def parameterize(string, option\\"-") do
    string
    |> String.normalize(:nfd)
    |> (&:iconv.convert("utf-8", "ascii//translit", &1)).()
    |> String.downcase()
    |> String.trim()
    |> String.replace(~r/#|\s|\%20|\W|\_|\-/, option)
    |> String.replace(~r/-+/, option)
    |> String.replace(~r/^#{option}|#{option}$/i, "")
  end
end
