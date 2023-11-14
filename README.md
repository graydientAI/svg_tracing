# SvgTracing

**Elixir Vector Graphics Converter **
An open source software to convert raster images (like jpg & png) into vector graphics (svg). It can vectorize graphics and photographs and trace the curves to output compact vector files.
This is backed by rust (vtracer) using rustler. You need to install [rust](https://www.rust-lang.org/tools/install) first.

## Installation

The package can be installed by adding `svg_tracing` to your list of dependencies in `mix.exs`:

```elixir
you need install rust 
def deps do
  [
    {:svg_tracing, "~> 0.1.4"}
  ]
end

iex(1)> SvgTracing.trace("priv/static/ikea-sofa.png", "priv/static/ikea-sofa.svg")
{:ok, {}}
```

### Examples

#### Input Image:
![input_image](/priv/static/example1.png)

#### Output SVG:
![input_image](/priv/static/example1.svg)


#### Input Image:
![input_image](/priv/static/example2.jpg)

#### Output SVG:
![input_image](/priv/static/example2.svg)


#### Input Image:
![input_image](/priv/static/example3.jpg)

#### Output SVG:
![input_image](/priv/static/example3.svg)
