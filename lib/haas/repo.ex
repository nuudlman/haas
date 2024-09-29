defmodule Haas.Repo do
  use Ecto.Repo,
    otp_app: :haas,
    adapter: Ecto.Adapters.SQLite3
end
