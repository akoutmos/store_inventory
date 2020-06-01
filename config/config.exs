import Config

config :store_inventory, ecto_repos: [StoreInventory.Repo]

config :store_inventory, StoreInventory.Repo,
  database: "store_inventory_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

import_config "#{Mix.env()}.exs"
