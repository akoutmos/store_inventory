defmodule StoreInventory.Repo.Migrations.Items do
  use Ecto.Migration

  def change do
    create table("items") do
      add(:name, :string)
      add(:description, :string)
      add(:price, :decimal)
      add(:quantity, :integer)

      timestamps()
    end
  end
end
