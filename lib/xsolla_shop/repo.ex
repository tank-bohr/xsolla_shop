defmodule XsollaShop.Repo do
  use Ecto.Repo,
    otp_app: :xsolla_shop,
    adapter: Ecto.Adapters.Postgres
end
