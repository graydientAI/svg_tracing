# SvgTracing

**Elixir Vector Graphics Converter **
An open source software to convert raster images (like jpg & png) into vector graphics (svg). It can vectorize graphics and photographs and trace the curves to output compact vector files.
This is backed by rust (vtracer) using rustler. You need to install [rust](https://www.rust-lang.org/tools/install) first.

## Binaries
| Binaries | Status |
| :---:   | :---: |
| [MasOS (M2)](burrito_out/svg_tracing_macos_m1) | Tested ✅  |
| [MacOS (Intel)](burrito_out/svg_tracing_macos) | Untested  ❌ |
| [Linux](burrito_out/svg_tracing_linux) | UnTested   ❌|

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `svg_tracing` to your list of dependencies in `mix.exs`:

```elixir
you need install rust 
def deps do
  [
    {:svg_tracing, "~> 0.1.4"}
  ]
end

iex(1)> SvgTracing.trace("priv/static/ikea-sofa.png", "priv/static/ikea-sofa.svg")
{:ok, {}}

#### Input Image:
![input_image](/priv/static/ikea-sofa.png)

#### Output SVG:
![input_image](/priv/static/ikea-sofa.svg)

```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/svg_tracing>.

