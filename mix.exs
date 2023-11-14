defmodule SvgTracing.MixProject do
  use Mix.Project
  @app :svg_tracing
  @source_url "https://github.com/graydientAI/svg_tracing"

  def project do
    [
      app: @app,
      name: "svg_tracing",
      description: "Elixir Vector Graphics Converter",
      version: "0.1.4",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make | Mix.compilers()],
      make_targets: ["all"],
      make_clean: ["clean"],
      deps: deps(),
      package: package(),
      releases: [{@app, release()}]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SvgTracingScript, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.29.1"},
      {:elixir_make, "~> 0.6.1"},
      {:bakeware, "~> 0.2.4", runtime: false},
      # {:bakeware, path: "../..", runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp release do
    [
      overwrite: true,
      cookie: "#{@app}_cookie",
      quiet: true,
      steps: [:assemble, &Bakeware.assemble/1],
      strip_beams: Mix.env() == :prod
    ]
  end

  defp package do
    [
      maintainers: ["Hassan Raza"],
      licenses: ["MIT"],
      links: %{GitHub: @source_url},
      canonical: "https://hexdocs.pm/svg_tracing",
      files: ~w(lib native priv .formatter.exs mix.exs README.md LICENSE CHANGELOG.md)
    ]
  end
end
