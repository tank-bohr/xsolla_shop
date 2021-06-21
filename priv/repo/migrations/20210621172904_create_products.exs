defmodule XsollaShop.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :sku, :string
      add :name, :string
      add :type, :string
      add :cost, :integer

      timestamps()
    end

    create unique_index(:products, [:sku])
  end
end
