defmodule PetsWeb.Router do
  use PetsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PetsWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/user", UserController, except: [:index] do
      resources "/pet", PetController, except: [:index]
    end

    resources "/sessions", SessionController, only: [:create]

    get "/login", SessionController, :new
    get "/logout", SessionController, :delete
  end

  scope "/admin", PetsWeb do
    pipe_through :browser

    get "/users", UserController, :index
    get "/user/:id/pet", PetController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PetsWeb do
  #   pipe_through :api
  # end
end
