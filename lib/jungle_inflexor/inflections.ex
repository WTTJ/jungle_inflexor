defmodule Jungle.Inflexor.Inflections do

  @default true

  @uncountable Application.get_env(:jungle_inflexor, :uncountable, []) ++ [
    "aircraft",
    "bellows",
    "bison",
    "deer",
    "equipment",
    "fish",
    "hovercraft",
    "information",
    "jeans",
    "means",
    "measles",
    "money",
    "moose",
    "news",
    "pants",
    "police",
    "rice",
    "series",
    "sheep",
    "spacecraft",
    "species",
    "swine",
    "tights",
    "tongs",
    "trousers"
    ]

  @irregular [
    { ~r/(alumn|cact|fung|radi|stimul|syllab)i/i, "\\1us" },
    { ~r/(alg|antenn|amoeb|larv|vertebr)ae/i, "\\1a" },
    { ~r/^(gen)era$/i, "\\1us"},
    { ~r/(pe)ople/i, "\\1rson" },
    { ~r/^(zombie)s$/i, "\\1" },
    { ~r/(g)eese/i, "\\1oose" },
    { ~r/(criteri)a/i, "\\1on" },
    { ~r/^(m)en$/i, "\\1an"},
    { ~r/^(echo)es/i, "\\1"},
    { ~r/^(hero)es/i, "\\1"},
    { ~r/^(potato)es/i, "\\1"},
    { ~r/^(tomato)es/i, "\\1"},
    { ~r/^(t)eeth/i, "\\1ooth"},
    { ~r/^(l)ice$/i, "\\1ouse"},
    { ~r/^(addend|bacteri|curricul|dat|memorand|quant)a$/i, "\\1um"},
    { ~r/^(di)ce/i, "\\1e"},
    { ~r/^(f)eet/i, "\\1oot"},
    { ~r/^(phenomen)a/i, "\\1on"},
  ]

  @plural_irregular [
    { ~r/(alumn|cact|fung|radi|stimul|syllab)us/i, "\\1i" },
    { ~r/(alg|antenn|amoeb|larv|vertebr)a/i, "\\1ae" },
    { ~r/^(gen)us$/i, "\\1era"},
    { ~r/(pe)rson/i, "\\1ople" },
    { ~r/^(zombie)s$/i, "\\1" },
    { ~r/(g)oose/i, "\\1eese" },
    { ~r/(criteri)on/i, "\\1a" },
    { ~r/^(men)$/i, "\\1"},
    { ~r/^(women)/i, "\\1"},
    { ~r/^(echo)/i, "\\1es"},
    { ~r/^(hero)/i, "\\1es"},
    { ~r/^(potato)/i, "\\1es"},
    { ~r/^(tomato)/i, "\\1es"},
    { ~r/^(t)ooth/i, "\\1eeth"},
    { ~r/^(l)ouse/i, "\\1ice"},
    { ~r/^(addend|bacteri|curricul|dat|memorand|quant)um$/i, "\\1a"},
    { ~r/^(di)e/i, "\\1ce"},
    { ~r/^(f)oot/i, "\\1eet"},
    { ~r/^(phenomen)on/i, "\\1a"}
  ]

  @plural Application.get_env(:jungle_inflexor, :plural, []) ++ @plural_irregular ++ [
      {~r/(?i)(.*)\b((?:atlas))$/, "atlases"},
      {~r/(?i)(.*)\b((?:beef))$/, "beefs"},
     {~r/(?i)(.*)\b((?:brother))$/, "brothers"},
     {~r/(?i)(.*)\b((?:cafe))$/, "cafes"},
     {~r/(?i)(.*)\b((?:child))$/, "children"},
     {~r/(?i)(.*)\b((?:cookie))$/, "cookies"},
     {~r/(?i)(.*)\b((?:corpus))$/, "corpuses"},
     {~r/(?i)(.*)\b((?:cow))$/, "cows"},
     {~r/(?i)(.*)\b((?:ganglion))$/, "ganglions"},
     {~r/(?i)(.*)\b((?:genie))$/, "genies"},
     {~r/(?i)(.*)\b((?:genus))$/, "genera"},
     {~r/(?i)(.*)\b((?:graffito))$/, "graffiti"},
     {~r/(?i)(.*)\b((?:hoof))$/, "hoofs"},
     {~r/(?i)(.*)\b((?:loaf))$/, "loaves"},
     {~r/(?i)(.*)\b((?:man))$/, "men"},
     {~r/(?i)(.*)\b((?:money))$/, "monies"},
     {~r/(?i)(.*)\b((?:mongoose))$/, "mongooses"},
     {~r/(?i)(.*)\b((?:move))$/, "moves"},
     {~r/(?i)(.*)\b((?:mythos))$/, "mythoi"},
     {~r/(?i)(.*)\b((?:niche))$/, "niches"},
     {~r/(?i)(.*)\b((?:numen))$/, "numina"},
     {~r/(?i)(.*)\b((?:occiput))$/, "occiputs"},
     {~r/(?i)(.*)\b((?:octopus))$/, "octopuses"},
     {~r/(?i)(.*)\b((?:opus))$/, "opuses"},
     {~r/(?i)(.*)\b((?:ox))$/, "oxen"},
     {~r/(?i)(.*)\b((?:penis))$/, "penises"},
     {~r/(?i)(.*)\b((?:person))$/, "people"},
     {~r/(?i)(.*)\b((?:sex))$/, "sexes"},
     {~r/(?i)(.*)\b((?:soliloquy))$/, "soliloquies"},
     {~r/(?i)(.*)\b((?:testis))$/, "testes"},
     {~r/(?i)(.*)\b((?:trilby))$/, "trilbys"},
     {~r/(?i)(.*)\b((?:turf))$/, "turfs"},
     {~r/(?i)(.*)\b((?:potato))$/, "potatoes"},
     {~r/(?i)(.*)\b((?:hero))$/, "heroes"},
     {~r/(?i)(.*)\b((?:tooth))$/, "teeth"},
     {~r/(?i)(.*)\b((?:goose))$/, "geese"},
     {~r/(?i)(.*)\b((?:foot))$/, "feet"},
     {~r/(?i)(s)tatus$/, "\\g{1}\\g{2}tatuses"},
     {~r/(?i)(quiz)$/, "\\g{1}zes"},
     {~r/(?i)^(ox)$/, "\\g{1}\\g{2}en"},
     {~r/(?i)([m|l])ouse$/, "\\g{1}ice"},
     {~r/(?i)(matr|vert|ind)(ix|ex)$/, "\\g{1}ices"},
     {~r/(?i)(x|ch|ss|sh)$/, "\\g{1}es"},
     {~r/(?i)([^aeiouy]|qu)y$/, "\\g{1}ies"},
     {~r/(?i)(hive)$/, "\\1s"},
     {~r/(?i)(?:([^f])fe|([lre])f)$/, "\\g{1}\\g{2}ves"},
     {~r/(?i)sis$/, "ses"},
     {~r/(?i)([ti])um$/, "\\g{1}a"},
     {~r/(?i)(p)erson$/, "\\g{1}eople"}, {~r/(?i)(m)an$/, "\\g{1}en"},
     {~r/(?i)(c)hild$/, "\\g{1}hildren"}, {~r/(?i)(buffal|tomat)o$/, "\\g{1}\\g{2}oes"},
     {~r/(?i)(alumn|bacill|cact|foc|fung|nucle|radi|stimul|syllab|termin|vir)us$/,"\\g{1}i"},
     {~r/(?i)us$/, "uses"},
     {~r/(?i)(alias)$/, "\\g{1}es"},
     {~r/(?i)(ax|cris|test)is$/, "\\g{1}es"},
     {~r/s$/, "s"},
     {~r/^$/, ""},
     {~r/$/, "s"}
]

  @singular Application.get_env(:jungle_inflexor, :singular, []) ++ @irregular ++
[
     {~r/(?i)(.*)\b((?:foes))$/, "foe"},
     {~r/(?i)(.*)\b((?:waves))$/, "wave"},
     {~r/(?i)(.*)\b((?:curves))$/, "curve"},
     {~r/(?i)(.*)\b((?:atlases))$/, "atlas"},
     {~r/(?i)(.*)\b((?:beefs))$/, "beef"},
     {~r/(?i)(.*)\b((?:brothers))$/, "brother"},
     {~r/(?i)(.*)\b((?:cafes))$/, "cafe"},
     {~r/(?i)(.*)\b((?:children))$/, "child"},
     {~r/(?i)(.*)\b((?:cookies))$/, "cookie"},
     {~r/(?i)(.*)\b((?:corpuses))$/, "corpus"},
     {~r/(?i)(.*)\b((?:cows))$/, "cow"},
     {~r/(?i)(.*)\b((?:ganglions))$/, "ganglion"},
     {~r/(?i)(.*)\b((?:genies))$/, "genie"},
     {~r/(?i)(.*)\b((?:genera))$/, "genus"},
     {~r/(?i)(.*)\b((?:graffiti))$/, "graffito"},
     {~r/(?i)(.*)\b((?:hoofs))$/, "hoof"},
     {~r/(?i)(.*)\b((?:loaves))$/, "loaf"},
     {~r/(?i)(.*)\b((?:men))$/, "man"},
     {~r/(?i)(.*)\b((?:monies))$/, "money"},
     {~r/(?i)(.*)\b((?:mongooses))$/, "mongoose"},
     {~r/(?i)(.*)\b((?:moves))$/, "move"},
     {~r/(?i)(.*)\b((?:mythoi))$/, "mythos"},
     {~r/(?i)(.*)\b((?:niches))$/, "niche"},
     {~r/(?i)(.*)\b((?:numina))$/, "numen"},
     {~r/(?i)(.*)\b((?:occiputs))$/, "occiput"},
     {~r/(?i)(.*)\b((?:octopuses))$/, "octopus"},
     {~r/(?i)(.*)\b((?:opuses))$/, "opus"},
     {~r/(?i)(.*)\b((?:oxen))$/, "ox"},
     {~r/(?i)(.*)\b((?:penises))$/, "penis"},
     {~r/(?i)(.*)\b((?:people))$/, "person"},
     {~r/(?i)(.*)\b((?:sexes))$/, "sex"},
     {~r/(?i)(.*)\b((?:soliloquies))$/, "soliloquy"},
     {~r/(?i)(.*)\b((?:testes))$/, "testis"},
     {~r/(?i)(.*)\b((?:trilbys))$/, "trilby"},
     {~r/(?i)(.*)\b((?:turfs))$/, "turf"},
     {~r/(?i)(.*)\b((?:potatoes))$/, "potato"},
     {~r/(?i)(.*)\b((?:heroes))$/, "hero"},
     {~r/(?i)(.*)\b((?:teeth))$/, "tooth"},
     {~r/(?i)(.*)\b((?:geese))$/, "goose"},
     {~r/(?i)(.*)\b((?:feet))$/, "foot"},
     {~r/eaus$/, "eau"},
     {~r/(?i)(s)tatuses$/, "\\g{1}\\g{2}tatus"},
     {~r/(?i)^(.*)(menu)s$/, "\\g{1}\\g{2}"},
     {~r/(?i)(quiz)zes$/, "\\1"},
     {~r/(?i)(matr)ices$/, "\\g{1}ix"},
     {~r/(?i)(vert|ind)ices$/, "\\g{1}ex"},
     {~r/(?i)^(ox)en/, "\\1"},
     {~r/(?i)(alias)(es)*$/, "\\1"},
     {~r/(?i)(alumn|bacill|cact|foc|fung|nucle|radi|stimul|syllab|termin|viri?)i$/,"\\g{1}us"},
     {~r/(?i)([ftw]ax)es/, "\\1"},
     {~r/(?i)(cris|ax|test)es$/, "\\g{1}is"},
     {~r/(?i)(shoe|slave)s$/, "\\1"},
     {~r/(?i)(o)es$/, "\\1"},
     {~r/ouses$/, "ouse"},
     {~r/([^a])uses$/, "\\g{1}us"},
     {~r/(?i)([m|l])ice$/, "\\g{1}ouse"},
     {~r/(?i)(x|ch|ss|sh)es$/, "\\1"},
     {~r/(?i)(m)ovies$/, "\\g{1}\\g{2}ovie"},
     {~r/(?i)(s)eries$/, "\\g{1}\\g{2}eries"},
     {~r/(?i)([^aeiouy]|qu)ies$/, "\\g{1}y"},
     {~r/(?i)(tive)s$/, "\\1"},
     {~r/(?i)([lre])ves$/, "\\g{1}f"},
     {~r/(?i)([^fo])ves$/, "\\g{1}fe"},
     {~r/(?i)(hive)s$/, "\\1"},
     {~r/(?i)(drive)s$/, "\\1"},
     {~r/(?i)(^analy)ses$/, "\\g{1}sis"},
     {~r/(?i)(analy|diagno|^ba|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$/,"\\g{1}\\g{2}sis"},
     {~r/(?i)([ti])a$/, "\\g{1}um"},
     {~r/(?i)(p)eople$/, "\\g{1}\\g{2}erson"},
     {~r/(?i)(m)en$/, "\\g{1}an"},
     {~r/(?i)(c)hildren$/, "\\g{1}\\g{2}hild"},
     {~r/(?i)(n)ews$/, "\\g{1}\\g{2}ews"},
     {~r/^(.*us)$/, "\\1"},
     {~r/(?i)s$/, ""}
    ]


  @doc """
  Returns the plural form of the word in the string.

  ## Examples

      iex> Jungle.Inflexor.pluralize("movie")
      "movies"

  """
  def pluralize(string, locale \\ "en") do
    apply_inflections(string, @plural)
  end

  @doc """
  The reverse of `pluralize`:w, returns the singular form of a word in a string.

  ## Examples

      iex> Jungle.Inflexor.singularize("quizzes")
      "quiz"

  """
  def singularize(string, locale \\ "en") do
    apply_inflections(string, @singular)
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

  defp is_uncountable?(string, list \\ @uncountable) do
    case Enum.find(list ,fn (regex) ->
      Regex.match?(~r/(?i)(^(?:.*#{regex}))$/, string)
    end) do
      nil -> false
      _ -> true
    end
  end

end
