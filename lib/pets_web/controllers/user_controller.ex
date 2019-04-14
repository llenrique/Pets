defmodule PetsWeb.UserController do
  use PetsWeb, :controller
  alias Pets.Contexts.UserManager

  def index(conn, _params) do
    users = UserManager.list()

    conn
    |> render("index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = UserManager.list_single_user(id)

    conn
    |> render("index.json", user: user)
  end
end
