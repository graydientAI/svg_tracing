defmodule SvgTracing.MixProject do
  use Mix.Project
  @source_url "https://github.com/graydientAI/svg_tracing"

  def project do
    [
      app: :svg_tracing,
      name: "svg_tracing",
      description: "Elixir Vector Graphics Converter",
      version: "0.1.2",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
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
      {:rustler, "~> 0.29.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Hassan Raza"],
      licenses: ["MIT"],
      links: %{GitHub: @source_url},
      canonical: "https://hexdocs.pm/svg_tracing",
      files: ~w(lib native .formatter.exs mix.exs README.md LICENSE CHANGELOG.md)
    ]
  end
end
