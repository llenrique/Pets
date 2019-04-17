defmodule PetsWeb.UserController do
  use PetsWeb, :controller
  alias Pets.Contexts.UserManager

  def index(conn, _params) do
    users = UserManager.list()

    conn
    |> render("index.html", users: users)
  end

  def new(conn, _params) do
    user = UserManager.new()
    conn
    |> render("new.html", user: user)
  end

  def create(conn, %{"user" => attrs}) do
    with {:ok, user} <- UserManager.create(attrs) do
      conn
      |> put_flash(:info, "User created!")
      |> redirect(to: Routes.user_path(conn, :show, user))
    end
  end

  def show(conn, %{"id" => id}) do
    user = UserManager.list_single(id)

    conn
    |> render("show.html", user: user)
  end
end
