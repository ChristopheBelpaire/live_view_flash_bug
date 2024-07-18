defmodule FlashBugWeb.FlashBugLive do
  use Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <button phx-click="flash">Flash!</button>
    <%= Map.get(@flash, "error") %>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket }
  end

  def handle_params(_params, _route, socket) do
    {:noreply, socket}
  end

  def handle_event("flash", _params, socket) do
    IO.inspect("button pushed")
    socket = put_flash(socket, :error, "Should display flash")
    {:noreply, socket}
  end
end
