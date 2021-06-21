defmodule XsollaShop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :cost, :integer
    field :name, :string
    field :sku, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:sku, :name, :type, :cost])
    |> validate_required([:sku, :name, :type, :cost])
    |> unique_constraint(:sku)
  end
end
