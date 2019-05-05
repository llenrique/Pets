defmodule PetsWeb.UserController do
  use PetsWeb, :controller
  alias Pets.Contexts.UserManager
  # alias PetsWeb.SessionController

  # def index(conn, _params) do
  #   users = UserManager.list()
  #
  #   conn
  #   |> render("index.html", users: users)
  # end

  def new(conn, _params) do
    user = UserManager.new()

    conn
    |> render("new.html", user: user)
  end

  def create(conn, %{"user" => attrs}) do
    case UserManager.create(attrs) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User Creaded")
        |> redirect(to: Routes.session_path(conn, :new))

      {:error, user} ->
        conn
        |> put_flash(:error, "Falied to create user")
        |> render("new.html", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    case UserManager.logical_delete(id) do
      {:ok, _} ->
        conn
        |> redirect(to: "/login")
    end

  end

  def show(conn, %{"id" => id}) do
    user = UserManager.list_single(id)

    conn
    |> render("show.html", user: user)
  end
end
