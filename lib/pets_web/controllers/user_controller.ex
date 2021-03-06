defmodule PetsWeb.UserController do
  use PetsWeb, :controller
  alias Pets.Helpers.UserHelper

  plug PetsWeb.VerifyUserSession when action in [:delete, :show, :edit, :update]
  plug :put_layout, "user_layout.html" when action in [:delete, :edit, :update, :show]

  def new(conn, _params) do
    case UserHelper.new do
      {:ok, user} ->
        conn
        |> assign(:genders, GenderEnum.__enum_map__())
        |> assign(:user_type, UserTypeEnum.__enum_map__())
        |> render("new.html", user: user)
    end
  end

  def create(conn, %{"user" => attrs}) do
    case UserHelper.create(attrs) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User Created")
        |> redirect(to: Routes.session_path(conn, :new))

      {:error, _} ->
        conn
        |> put_flash(:error, "Falied to create user")
        |> redirect(to: Routes.user_path(conn, :new))
    end
  end

  def delete(conn, %{"id" => id}) do
    case UserHelper.delete(id) do
      {:ok, _} ->
        conn
        |> redirect(to: Routes.session_path(conn, :new))
    end

  end

  def show(conn, %{"id" => id}) do
    case UserHelper.show(id) do
      {:ok, user} ->
        conn
        |> render("show.html", user: user)
    end
  end

  def edit(conn, %{"id" => id}) do
    case UserHelper.edit(id) do
      {:ok, changeset} ->
        user = get_session(conn, :user)
        conn
        |> assign(:genders, GenderEnum.__enum_map__())
        |> assign(:user, user)
        |> assign(:changeset, changeset)
        |> render("edit.html")
    end
  end

  def update(conn, %{"id" => id, "user" => attrs}) do
    case UserHelper.update(id, attrs) do
      {:ok, u_user} ->
        conn
        |> put_flash(:info, "User updated")
        |> redirect(to: Routes.user_path(conn, :show, u_user))
    end
  end
end
