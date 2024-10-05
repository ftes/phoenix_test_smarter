defmodule Smart.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SmartWeb.Telemetry,
      Smart.Repo,
      {DNSCluster, query: Application.get_env(:smart, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Smart.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Smart.Finch},
      # Start a worker by calling: Smart.Worker.start_link(arg)
      # {Smart.Worker, arg},
      # Start to serve requests, typically the last entry
      SmartWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Smart.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SmartWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
