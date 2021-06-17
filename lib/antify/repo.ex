defmodule Antify.Repo do
  use Ecto.Repo,
    otp_app: :antify,
    adapter: Ecto.Adapters.Postgres
end
