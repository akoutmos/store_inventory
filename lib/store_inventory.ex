defmodule StoreInventory do
  alias StoreInventory.Item

  @repo Application.get_env(:store_inventory, :repo)

  def insert_item(params) do
    %Item{}
    |> Item.changeset(params)
    |> @repo.insert()
  end

  def all_items do
    @repo.all(Item)
  end

  def average_item_price do
    {total, num_items} =
      all_items()
      |> Enum.reduce({0, 0}, fn %Item{} = item, {sum, count} ->
        {sum + item.price, count + 1}
      end)

    if num_items == 0,
      do: 0,
      else: total / num_items
  end
end
