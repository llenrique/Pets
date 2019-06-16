defmodule PetsWeb.SessionController do
  use PetsWeb, :controller
  alias Pets.Contexts.UserManager

  def new(conn, _) do
    case get_session(conn, :user) do
      nil ->
        conn
        |> render("new.html")
      user ->
        conn
        |> redirect(to: Routes.user_path(conn, :show, user.id))
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:user)
    |> put_flash(:info, "Logged out successfully!")
    |> redirect(to: Routes.session_path(conn, :new))
  end

  def create(conn, %{"username" => username, "password" => password}) do
    with \
      user <- UserManager.get_user_by_username(username),
      {:ok, login_user} <- login(user, password)
    do
      conn
      |> put_flash(:info, "Logged in successfully!")
      |> put_session(:user, %{
        id: login_user.id,
        username: login_user.username,
        email: login_user.email
      })
      |> redirect(to: "/user/#{login_user.id}")
    else
      {:error, _} ->
        conn
        |> put_flash(:error, "Invalid credentials")
        |> redirect(to: Routes.session_path(conn, :new))
    end
  end

  defp login(user, password) do
    Bcrypt.check_pass(user, password)
  end
end
