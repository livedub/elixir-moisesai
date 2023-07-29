# MoisesAI

Elixir wrapper of [MoisesAI](https://developer.moises.ai/docs/api/reference)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add one_signal to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [{:moises_ai, git: "https://github.com/livedub/elixir-moisesai.git"}]
  end
```

  2. Ensure one_signal is started before your application:

```elixir
  def application do
    [applications: [:moises_ai]]
  end
```

  3. Puts config your `config.exs`

```elixir
config :moises_ai, MoisesAI,
  api_key: "your api key",
```
