defmodule AudioHookWeb.PageController do
  use AudioHookWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def callback(conn, %{"url" => url}) do
    IO.puts("Audio clicked! URL received: #{url}")
    json(conn, %{message: "received", url: url})
  end
end
