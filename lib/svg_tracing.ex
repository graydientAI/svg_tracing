defmodule SvgTracing do
  alias SvgTracing.Tracer

  def start(_, _args) do
    [a, b] = Burrito.Util.Args.get_arguments()
    IO.puts("Preparing from heart 💙")
    trace(a, b)
    IO.puts("Hurry, Ready at #{b}")
    System.halt(0)
  end

  @moduledoc ~S"""
  An open source software to convert raster images (like jpg & png) into vector graphics (svg).
  It can vectorize graphics and photographs and trace the curves to output compact vector files.
  This is backed by rust (vtracer) using rustler.

  iex> SvgTracing.trace("priv/static/ikea-sofa.png", "priv/static/ikea-sofa.svg")
  {:ok, {}}
  """
  defstruct input_path: "",
            output_path: "",
            colormode: "color",
            hierarchical: "stacked",
            mode: "spline",
            filter_speckle: 4,
            color_precision: 6,
            layer_difference: 16,
            corner_threshold: 60,
            length_threshold: 4.0,
            max_iterations: 10,
            splice_threshold: 45,
            path_precision: 8

  @doc """
  Convert images to vector graphics, this will need two paths, input image path
  and second output image path to save svg.
  
  iex(1)> SvgTracing.trace("priv/static/ikea-sofa.png", "priv/static/ikea-sofa.svg")
  {:ok, {}}
  """
  @spec trace(String.t(), String.t()) :: {:ok, {}} | {:error, String.t()}
  def trace(input_path, output_path) do
    default_values = %SvgTracing{}

    Tracer.convert_to_svg(
      input_path,
      output_path,
      "color",
      default_values.hierarchical,
      default_values.mode,
      default_values.filter_speckle,
      default_values.color_precision,
      default_values.layer_difference,
      default_values.corner_threshold,
      default_values.length_threshold,
      default_values.max_iterations,
      default_values.splice_threshold,
      default_values.path_precision
    )
  end

  # @spec trace(Binary) :: {:ok, {}} | {:error, String.t()}
  def trace(binary) do
    default_values = %SvgTracing{}

    Tracer.convert_to_svg(
      binary,
      "",
      default_values.colormode,
      default_values.hierarchical,
      default_values.mode,
      default_values.filter_speckle,
      default_values.color_precision,
      default_values.layer_difference,
      default_values.corner_threshold,
      default_values.length_threshold,
      default_values.max_iterations,
      default_values.splice_threshold,
      default_values.path_precision
    )
  end
end
