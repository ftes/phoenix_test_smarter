defmodule Smart.Repo do
  use Ecto.Repo,
    otp_app: :smart,
    adapter: Ecto.Adapters.Postgres
end
