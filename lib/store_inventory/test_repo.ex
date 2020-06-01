defmodule StoreInventory.TestRepo do
  alias Ecto.Changeset
  alias StoreInventory.Item

  def all(Item, _opts \\ []) do
    [
      %Item{
        name: "Thing 1",
        description: "A really cool thing",
        price: 100,
        quantity: 2
      },
      %Item{
        name: "Thing 2",
        description: "Another really cool thing",
        price: 50,
        quantity: 0
      },
      %Item{
        name: "Thing 3",
        description: "A really cool thing",
        price: 75,
        quantity: 5
      }
    ]
  end

  def insert(changeset, opts \\ [])

  def insert(%Changeset{errors: [], changes: values}, _opts) do
    {:ok, struct(Item, values)}
  end

  def insert(changeset, _opts) do
    {:error, changeset}
  end
end
