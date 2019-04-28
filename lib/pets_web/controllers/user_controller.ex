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
    case UserManager.create(attrs) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User Creaded")
        |> redirect(to: Routes.user_path(conn, :show, user))
      {:error, user} ->
        conn
        |> put_flash(:error, "Falied to create user")
        |> render("new.html", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = UserManager.list_single(id)

    conn
    |> render("show.html", user: user)
  end
end
