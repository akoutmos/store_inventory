defmodule StoreInventory.Item do
  use Ecto.Schema

  import Ecto.Changeset

  alias __MODULE__

  @all_fields [:name, :description, :price, :quantity]

  schema "items" do
    field(:name, :string)
    field(:description, :string)
    field(:price, :decimal)
    field(:quantity, :integer)

    timestamps()
  end

  def changeset(%Item{} = item, params \\ %{}) do
    item
    |> cast(params, @all_fields)
    |> validate_required(@all_fields)
    |> validate_number(:quantity, greater_than: 0)
    |> validate_number(:price, greater_than: 0)
  end
end
