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
      deps: deps()
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
      {:iconv, "~> 1.0.7"}
    ]
  end
end
