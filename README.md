# Jungle.Inflexor

## Prerequisites for mac users

You may need to install libicon to use jungle_inflexor. To do so with homebrew, do the following: `brew install libiconv`

## Installation

If [available in Hex](https://hex.pm/packages/jungle_inflexor), the package can be installed
by adding `jungle_inflexor` to your list of dependencies in `mix.exs`:

Add the latest stable release to your `mix.exs` file:

```elixir
defp deps do
  [
    {:jungle_inflexor, "~> 0.1.1"}
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
* humanize
* titleize

For some examples, have a look at the [documentation](https://hexdocs.pm/jungle_inflexor)

## Tests

`mix test`

## Contributing

1. Create an issue and describe your idea
2. [Fork it](https://github.com/WTTJ/jungle_inflexor/fork)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Publish the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
