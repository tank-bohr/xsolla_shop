defmodule XsollaShopWeb.Router do
  use XsollaShopWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", XsollaShopWeb do
    pipe_through :api

    resources "/products", ProductController, except: [:new, :edit]
  end
end
