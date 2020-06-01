defmodule StoreInventoryTest do
  use ExUnit.Case

  alias Ecto.Changeset
  alias StoreInventory.Item

  test "insert_item/1 should return an error when invalid params are provided" do
    params = %{
      name: "Item",
      description: "Something people want",
      price: 1,
      quantity: "INVALID"
    }

    {:error, changeset} = StoreInventory.insert_item(params)

    expected_error = {"is invalid", [type: :integer, validation: :cast]}
    assert %Changeset{errors: [quantity: ^expected_error]} = changeset
  end

  test "insert_item/1 should return an :ok tuple when valid params are provided" do
    params = %{
      name: "Item",
      description: "Something people want",
      price: 1,
      quantity: 5
    }

    assert {:ok, %Item{}} = StoreInventory.insert_item(params)
  end

  test "average_item_price/0 should return the average price of all the items in the DB" do
    assert 75.0 = StoreInventory.average_item_price()
  end
end
