defmodule Ptodo.Repo do
  use Ecto.Repo,
    otp_app: :ptodo,
    adapter: Ecto.Adapters.Postgres
end
