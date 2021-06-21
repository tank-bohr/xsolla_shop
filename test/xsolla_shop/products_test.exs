defmodule XsollaShop.ProductsTest do
  use XsollaShop.DataCase

  alias XsollaShop.Products

  describe "products" do
    alias XsollaShop.Products.Product

    @valid_attrs %{cost: 42, name: "some name", sku: "some sku", type: "some type"}
    @update_attrs %{cost: 43, name: "some updated name", sku: "some updated sku", type: "some updated type"}
    @invalid_attrs %{cost: nil, name: nil, sku: nil, type: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Products.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Products.create_product(@valid_attrs)
      assert product.cost == 42
      assert product.name == "some name"
      assert product.sku == "some sku"
      assert product.type == "some type"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Products.update_product(product, @update_attrs)
      assert product.cost == 43
      assert product.name == "some updated name"
      assert product.sku == "some updated sku"
      assert product.type == "some updated type"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end
end
