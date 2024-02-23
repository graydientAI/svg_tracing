defmodule SvgTracing.CopyNIF do
  alias Burrito.Builder.Step
  @behaviour Step

  @impl Step
  def execute(%Burrito.Builder.Context{} = context) do
    dir =
    Path.join(context.work_dir, [
      "lib",
      "/svg_tracing-#{context.mix_release.version}",
      "/priv",
      "/native"
    ])
    File.mkdir_p!(dir)
    case context.target.alias do
      :macos_m1 ->
        File.copy!(
          "priv/native/libsvgtracing_tracer.so",
          Path.join(dir, "libsvgtracing_tracer.so")
        )

      :macos ->
        File.copy!(
          "priv/native/libsvgtracing_tracer.so",
          Path.join(dir, "libsvgtracing_tracer.so")
        )

      :linux ->
        File.copy!(
          "priv/native/libsvgtracing_tracer.so",
          Path.join(dir, "libsvgtracing_tracer.so")
        )
      alias ->
        raise "unknown target alias #{inspect(alias)}"
    end

    context
  end
end
