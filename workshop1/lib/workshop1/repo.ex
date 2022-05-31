defmodule Workshop1.Repo do
  use Ecto.Repo,
    otp_app: :workshop1,
    adapter: Ecto.Adapters.Postgres
end
