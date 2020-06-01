defmodule StoreInventory.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: StoreInventory.Supervisor]
    Supervisor.start_link(get_children(), opts)
  end

  defp get_children do
    case Mix.env() do
      :test -> []
      _ -> [StoreInventory.Repo]
    end
  end
end
