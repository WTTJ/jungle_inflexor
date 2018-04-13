# Jungle.Inflexor

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `jungle_inflexor` to your list of dependencies in `mix.exs`:

Add the latest stable release to your `mix.exs` file:

```elixir
defp deps do
  [
    {:jungle_inflexor, "~> 0.1.0"}
  ]
end

defp application do
  [applications: [:jungle_inflexor]]
end
```

Then run `mix deps.get` in your shell to fetch the dependencies.

## Available commands:
* parameterize
* pluralize
* singularize
* ordinalize
* underscore
