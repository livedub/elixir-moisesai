defmodule MoisesAI do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MoisesAI.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def endpoint, do: "https://developer-api.moises.ai/api"

  def new do
    %{} # MoisesAI.Param{}
  end

  def auth_header do
    %{"Authorization" => "Basic " <> fetch_api_key(),
      "Content-type" => "application/json"}
  end

  defp config do
    Application.get_env(:moises_ai, MoisesAI)
  end

  defp fetch_api_key do
    config()[:api_key] ||
      System.get_env("MOISES_API_KEY")
  end
end
