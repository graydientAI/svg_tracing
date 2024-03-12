defmodule SvgTracing.MixProject do
  use Mix.Project
  @source_url "https://github.com/graydientAI/svg_tracing"

  def project do
    [
      app: :svg_tracing,
      name: "svg_tracing",
      description: "Elixir Vector Graphics Converter",
      version: "0.1.5",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      releases: releases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      # mod: {SvgTracing, []}  # enable only when compiling binaries
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.29.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:burrito, "~> 1.0"}
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

  def releases do
    [
      svg_tracing: [
        steps: [:assemble, &Burrito.wrap/1],
        burrito: [
          targets: [
            macos_m1: [os: :darwin, cpu: :aarch64],
            # macos: [os: :darwin, cpu: :x86_64],
            # linux: [os: :linux, cpu: :x86_64],
            # windows: [os: :windows, cpu: :x86_64]
          ],
          extra_steps: [
            patch: [
              pre: [SvgTracing.CopyNIF],
              post: [SvgTracing.RemoveNixStoreRefs]
            ]
          ],
          no_clean: false,
          debug: Mix.env() != :prod,
        ]
      ]
    ]
  end
end
