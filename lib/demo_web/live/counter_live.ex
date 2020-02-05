defmodule DemoWeb.CounterLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      <p>Label <%= @counter %></p>
      <button phx-click="increment">Button A <%= @counter %></button>
      <button phx-click="increment">Button B <%= @counter %></button>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, counter: 0)}
  end

  def handle_event("update", %{"width" => width, "bg" => bg}, socket) do
    {:noreply, assign(socket, width: String.to_integer(width), bg: bg)}
  end

  def handle_event("increment", _, socket) do
    {:noreply, update(socket, :counter, &(&1 + 1))}
  end
end
