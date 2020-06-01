defmodule StoreInventory.Repo do
  use Ecto.Repo,
    otp_app: :store_inventory,
    adapter: Ecto.Adapters.Postgres
end
