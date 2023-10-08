defmodule SvgTracing do
  alias SvgTracing.Tracer

  defstruct [
    input_path: "",
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
  ]

  defdelegate add(a, b), to: Tracer, as: :add

  def trace(input_path, output_path) do
    default_values = %SvgTracing{}

    Tracer.convert_to_svg(
      input_path,
      output_path,
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
