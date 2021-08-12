defmodule Politicians.Repo do
  use Ecto.Repo,
    otp_app: :politicians,
    adapter: Ecto.Adapters.Postgres
end
