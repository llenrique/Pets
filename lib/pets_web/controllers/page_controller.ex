defmodule PetsWeb.PageController do
  use PetsWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
