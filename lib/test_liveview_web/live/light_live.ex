defmodule TestLiveviewWeb.LightLive do
  use TestLiveviewWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, brightness: 10)}
  end

  def render(assigns) do
    ~H"""
    <h1>Front Porch Light</h1>
    <div id="light">
      <div class="meter">
        <span style={"width: #{@brightness}%"}>
          <%= @brightness %>%
        </span>
      </div>
      <button phx-click="off">
        Off
      </button>
      <button phx-click="on">
        On
      </button>
    </div>
    """
  end

  def handle_event("off", _, socket) do
    {:noreply, assign(socket, :brightness, 0)}
  end
  def handle_event("on", _, socket) do
    {:noreply, assign(socket, :brightness, 100)}
  end
end
