defmodule KargoSystem.Repo do
  use Ecto.Repo,
    otp_app: :kargo_system,
    adapter: Ecto.Adapters.Postgres
end
