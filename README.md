# SvgTracing

**Elixir Vector Graphics Converter **
An open source software to convert raster images (like jpg & png) into vector graphics (svg). It can vectorize graphics and photographs and trace the curves to output compact vector files.
This is backed by rust (vtracer) using rustler. You need to install [rust](https://www.rust-lang.org/tools/install) first.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `svg_tracing` to your list of dependencies in `mix.exs`:

```elixir
you need install rust 
def deps do
  [
    {:svg_tracing, "~> 0.1.0"}
  ]
end

iex(1)> SvgTracing.trace("priv/static/ikea-sofa.png", "priv/static/ikea-sofa.svg")
{:ok, {}}
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/svg_tracing>.

