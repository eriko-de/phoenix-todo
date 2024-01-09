defmodule Ptodo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PtodoWeb.Telemetry,
      Ptodo.Repo,
      {DNSCluster, query: Application.get_env(:ptodo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Ptodo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Ptodo.Finch},
      # Start a worker by calling: Ptodo.Worker.start_link(arg)
      # {Ptodo.Worker, arg},
      # Start to serve requests, typically the last entry
      PtodoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ptodo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PtodoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
