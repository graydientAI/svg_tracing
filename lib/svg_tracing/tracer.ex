defmodule SvgTracing.Tracer do
  use Rustler, otp_app: :svg_tracing, crate: "svgtracing_tracer"
  def convert_to_svg(_a, _b, _, _, _, _, _, _, _, _, _, _, _), do: {:error, error()}

  # When your NIF is loaded, it will override this function.
  defp error, do: :erlang.nif_error(:nif_not_loaded)
end
