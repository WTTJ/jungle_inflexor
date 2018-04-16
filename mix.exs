Code.ensure_loaded?(Hex) and Hex.start

defmodule Jungle.Inflexor.Mixfile do
  use Mix.Project

  def project do
    [
      app: :jungle_inflexor,
      version: "0.1.0",
      elixir: "~> 1.5",
      deps: deps(),
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      name: "Jungle.Inflexor",
      source_url: "https://github.com/WTTJ/jungle-inflexor",
      docs: [main: "Jungle.Inflexor", extras: ["README.md"]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:iconv, "~> 1.0.7"},
      {:ex_doc, "~> 0.18.3"}
    ]
  end

  defp description do
    """
    Elixir version of Rails ActiveSupport::Inflector
    """
  end

  defp package do
    [
      name: :jungle_inflexor,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["shawarma@wttj.co"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/wttj/jungle_inflexor" }
    ]
  end
end
