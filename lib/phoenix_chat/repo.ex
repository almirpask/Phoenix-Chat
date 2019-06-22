defmodule PhoenixChat.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_chat,
    adapter: Ecto.Adapters.Postgres
end
