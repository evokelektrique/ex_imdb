# ExImdb
Crawl and browse through IMDB titles


## Usage

```elixir
ExImdb.find("Batman")
  #[
  #  %{name: "The Batman", year: "2022"},
  #  %{name: "Batman", year: "1989"},
  #  %{name: "Batman", year: "1992"},
  #  ...
  #]
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_imdb` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_imdb, "~> 0.0.1"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_imdb](https://hexdocs.pm/ex_imdb).
