defmodule MoisesAI.Mixfile do
  use Mix.Project

  @description "Elixir wrapper of Moises.AI"

  def project do
    [app: :moisesai,
     version: "1.0.0",
     elixir: "~> 1.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: @description,
     package: package()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [mod: {MoisesAI, []},
     extra_applications: [:logger, :httpoison]]
  end

  defp package do
    [maintainers: ["Fernando YoshPauerida"],
      licenses: ["GNU"],
      links: %{"GitHub" => "https://github.com/livedub/elixir-moisesai"},
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 2.0"},
      {:ex_doc, "~> 0.8.0", only: :docs}
    ]
  end
end
