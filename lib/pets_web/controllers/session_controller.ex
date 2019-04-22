defmodule PetsWeb.SessionController do
  use PetsWeb, :controller
  alias Pets.Contexts.UserManager

  def new(conn, _) do
    conn
    |> render("new.html")
  end

  def delete(conn, _) do
    conn
    |> delete_session(:user)
    |> put_flash(:info, "Logged out successfully!")
    |> redirect(to: "/")
  end

  def create(conn, %{"username" => username, "password" => password}) do
    with user <- UserManager.get_user_by_username(username),
      {:ok, login_user} <- login(user, password)
    do
      conn
      |> put_flash(:info, "Logged in successfully!")
      |> put_session(:user, %{id: login_user.id, username: login_user.username, email: login_user.email})
      |> redirect(to: "/")
    else
      {:error, _} ->
        conn
        |> put_flash(:error, "Invalid credentials")
        |> render("new.html")
    end
  end

  defp login(user, password) do
    Bcrypt.check_pass(user, password)
  end
end
