defmodule AudioHookWeb.PageLive do
  use AudioHookWeb, :live_view
  require Logger

  def mount(_params, _session, socket) do
    {:ok, assign(socket, api_response: nil)}
  end

  def handle_event("audio_play_clicked", %{"url" => url}, socket) do
    Logger.info("📥 Received Audio URL: #{url}")

    # Example GET request (replace with your real API)
    case Req.get("https://api.publicapis.org/entries") do
      {:ok, %Req.Response{status: 200, body: body}} ->
        {:noreply, assign(socket, api_response: "✅ Success: #{inspect(body)}")}

      {:error, error} ->
        {:noreply, assign(socket, api_response: "❌ Error: #{inspect(error)}")}
    end
  end
end
