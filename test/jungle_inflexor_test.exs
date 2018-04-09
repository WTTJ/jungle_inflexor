defmodule Jungle.InflexorTest do
  use ExUnit.Case

  import Jungle.Inflexor
  alias Jungle.Inflexor.InflectionCases

  test :parameterize do
    assert parameterize("jungle inflexor")                       == "jungle-inflexor"
    assert parameterize("Jungle Inflexor")                       == "jungle-inflexor"
    assert parameterize("jungle-infléxør")                       == "jungle-inflexor"
    assert parameterize("jungle inflexor", "_")                  == "jungle_inflexor"
    assert parameterize("jungle%20inflexor")                     == "jungle-inflexor"
    assert parameterize("ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëÇçðÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž")    == "aaaaaaaaaaaaoooooooooooooeeeeeeeeccddiiiiiiiiuuuuuuuunnssyyyzz"
    assert parameterize("Donald E. Knuth")                      == "donald-e-knuth"
    assert parameterize("With-some-dashes")                     == "with-some-dashes"
    assert parameterize("Random text with *(bad)* characters")  == "random-text-with-bad-characters"
    assert parameterize("Trailing bad characters!@#")           == "trailing-bad-characters"
    assert parameterize("!@#Leading bad characters")            == "leading-bad-characters"
    assert parameterize("Squeeze   separators")                 == "squeeze-separators"
    assert parameterize("Test with + sign")                     == "test-with-sign"
    assert parameterize("Test with malformed utf8 \251")        == "test-with-malformed-utf8-251"
  end

  test :ordinalize do
    assert ordinalize(-1) == "-1st"
    assert ordinalize(-2) == "-2nd"
    assert ordinalize(-3) == "-3rd"
    assert ordinalize(-4) == "-4th"
    assert ordinalize(-5) == "-5th"
    assert ordinalize(-6) == "-6th"
    assert ordinalize(-7) == "-7th"
    assert ordinalize(-8) == "-8th"
    assert ordinalize(-9) == "-9th"
    assert ordinalize(-10) == "-10th"
    assert ordinalize(-11) == "-11th"
    assert ordinalize(-12) == "-12th"
    assert ordinalize(-13) == "-13th"
    assert ordinalize(-14) == "-14th"
    assert ordinalize(-20) == "-20th"
    assert ordinalize(-21) == "-21st"
    assert ordinalize(-22) == "-22nd"
    assert ordinalize(-23) == "-23rd"
    assert ordinalize(-24) == "-24th"
    assert ordinalize(-100) == "-100th"
    assert ordinalize(-101) == "-101st"
    assert ordinalize(-102) == "-102nd"
    assert ordinalize(-103) == "-103rd"
    assert ordinalize(-104) == "-104th"
    assert ordinalize(-110) == "-110th"
    assert ordinalize(-111) == "-111th"
    assert ordinalize(-112) == "-112th"
    assert ordinalize(-113) == "-113th"
    assert ordinalize(-1000) == "-1000th"
    assert ordinalize(-1001) == "-1001st"
    assert ordinalize(0) == "0th"
    assert ordinalize(1) == "1st"
    assert ordinalize(2) == "2nd"
    assert ordinalize(3) == "3rd"
    assert ordinalize(4) == "4th"
    assert ordinalize(5) == "5th"
    assert ordinalize(6) == "6th"
    assert ordinalize(7) == "7th"
    assert ordinalize(8) == "8th"
    assert ordinalize(9) == "9th"
    assert ordinalize(10) == "10th"
    assert ordinalize(11) == "11th"
    assert ordinalize(12) == "12th"
    assert ordinalize(13) == "13th"
    assert ordinalize(14) == "14th"
    assert ordinalize(20) == "20th"
    assert ordinalize(21) == "21st"
    assert ordinalize(22) == "22nd"
    assert ordinalize(23) == "23rd"
    assert ordinalize(24) == "24th"
    assert ordinalize(100) == "100th"
    assert ordinalize(101) == "101st"
    assert ordinalize(102) == "102nd"
    assert ordinalize(103) == "103rd"
    assert ordinalize(104) == "104th"
    assert ordinalize(110) == "110th"
    assert ordinalize(111) == "111th"
    assert ordinalize(112) == "112th"
    assert ordinalize(113) == "113th"
    assert ordinalize(1000) == "1000th"
    assert ordinalize(1001) == "1001st"
  end

  test :underscore do
    assert underscore("UpperCamelCase") == "upper_camel_case"
    assert underscore("lowerCamelCase") == "lower_camel_case"
    assert underscore(UpperCamelCase) == "upper_camel_case"
    assert underscore(:lowerCamelCase) == "lower_camel_case"
    assert underscore("jungle-inflexor") == "jungle_inflexor"
    assert underscore("JUNGLE-Inflexor") == "jungle_inflexor"
    assert underscore("JUNGLEInflexor") == "jungle_inflexor"
    assert underscore("JUNGLE\Inflexor") == "jungle_inflexor"
  end

  test :inflections do
    plural = %{
      "switch"      => "switches",
      "fix"         => "fixes",
      "box"         => "boxes",
      "process"     => "processes",
      "address"     => "addresses",
      "case"        => "cases",
      "wish"        => "wishes",
      "fish"        => "fish",
      "jeans"       => "jeans",
      "funky jeans" => "funky jeans",
      "my money"    => "my money",

      "category"    => "categories",
      "query"       => "queries",
      "ability"     => "abilities",
      "agency"      => "agencies",
      "movie"       => "movies",

      #FIXME check regexps 
      # "archive"     => "archives",

      "index"       => "indices",

      "wife"        => "wives",
      "safe"        => "saves",
      "half"        => "halves",

      "move"        => "moves",

      "salesperson" => "salespeople",
      "person"      => "people",

      "spokesman"   => "spokesmen",
      "man"         => "men",
      "woman"       => "women",

      "basis"       => "bases",
      "diagnosis"   => "diagnoses",
      "diagnosis_a" => "diagnosis_as",

      "datum"       => "data",
      "medium"      => "media",
      "stadium"     => "stadia",
      "analysis"    => "analyses",
      "my_analysis" => "my_analyses",

      "node_child"  => "node_children",
      "child"       => "children",

      "experience"  => "experiences",
      "day"         => "days",

      "comment"     => "comments",
      "foobar"      => "foobars",
      "newsletter"  => "newsletters",

      "old_news"    => "old_news",
      "news"        => "news",

      "series"      => "series",
      "miniseries"  => "miniseries",
      "species"     => "species",

      "quiz"        => "quizzes",

      "ox"          => "oxen",
      "photo"       => "photos",
      "buffalo"     => "buffaloes",
      "tomato"      => "tomatoes",
      "dwarf"       => "dwarves",
      "elf"         => "elves",
      "information" => "information",
      "equipment"   => "equipment",
      "bus"         => "buses",
      "status"      => "statuses",
      "status_code" => "status_codes",
      "mouse"       => "mice",

      "louse"       => "lice",
      "house"       => "houses",
      "octopus"     => "octopuses",
      "virus"       => "viri",
      "alias"       => "aliases",

      "vertex"      => "vertices",
      "matrix"      => "matrices",
      #FIXME check regexps
      # "matrix_fu"   => "matrix_fus",

      "axis"        => "axes",
      "taxi"        => "taxis", # prevents regression
      "testis"      => "testes",
      "crisis"      => "crises",

      "rice"        => "rice",
      "shoe"        => "shoes",

      "horse"       => "horses",
      "prize"       => "prizes",
      "edge"        => "edges",

      "database"    => "databases",
    }

    assert pluralize("aircraft") == "aircraft"
    assert pluralize("search") == "searches"
    assert singularize("searches") == "search"
    Enum.map(plural, fn {k, v} ->
      assert pluralize(k) == v
      assert singularize(v) == k
    end)
  end

end
