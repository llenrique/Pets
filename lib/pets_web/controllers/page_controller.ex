defmodule PetsWeb.PageController do
  use PetsWeb, :controller

  def index(conn, _params) do
    case get_session(conn, :user) do
      nil ->
        conn
        |> render("index.html")
      user ->
        conn
        |> put_layout("user_layout.html")
        |> render("index.html")
    end
  end
end
