defmodule SvgTracing do
  @moduledoc ~S"""
  An open source software to convert raster images (like jpg & png) into vector graphics (svg).
  It can vecterize graphics and photographs and trace the curves to output compact vector files.
  This is backed by rust (vtracer) using rustler.

  iex> SvgTracing.trace("priv/static/ikea-sofa.png", "priv/static/ikea-sofa.svg")
  {:ok, {}}
  """
  alias SvgTracing.Tracer

  @output_file_prefix "svg_tracing_"
  @output_file_random_number 100

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

  def start(_ab, _args) do
    [input, output] = Burrito.Util.Args.get_arguments()
    |> get_params()
    |> preparing_log()

    trace(input, output)

    System.halt(0)
  end

  defp get_params([]), do: IO.puts("Oh no, Missing input image"); [nil, nil]
  defp get_params([input | []]), do: [input, "#{@output_file_prefix}#{:rand.uniform(@output_file_random_number)}.svg"]
  defp get_params([input, output | _]), do: [input, output]

  defp preparing_log(input) do
    IO.puts("Preparing svg from heart 💙")
    input
  end

  @doc """
  Convert images to vector graphics, this will need two paths, input image path
  and second output image path to save svg.

  iex(1)> SvgTracing.trace("priv/static/ikea-sofa.png", "priv/static/ikea-sofa.svg")
  {:ok, {}}
  """
  @spec trace(String.t(), String.t()) :: {:ok, {}} | {:error, String.t()}
  def trace(nil, nil), do: {:error, "Missing Required Argument"}
  def trace(input), do: trace(input, "#{@output_file_prefix}#{:rand.uniform(@output_file_random_number)}.svg")

  @spec trace(String.t(), String.t()) :: {:ok, {}} | {:error, String.t()}
  def trace(input_path, output_path) do
    input_path
    |> File.exists?()
    |> process_request(input_path, output_path)
  end

  defp process_request(true, input_path, output_path) do
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

    IO.puts("Hurry, Ready at #{output_path}")
  end

  defp process_request(false, input_path, _output_path) do
    {:error, "No file found at #{input_path}"}
  end
end
