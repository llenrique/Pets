defmodule PetsWeb.UserController do
  use PetsWeb, :controller
  alias Pets.Contexts.UserManager

  def index(conn, _params) do
    users = UserManager.list

    conn
    |> render(:index, users: users)
  end

  def show(conn, %{"id" => id}) do
    user = UserManager.list_single_user(id)

    conn
    |> render(:show, user: user)
  end
end
