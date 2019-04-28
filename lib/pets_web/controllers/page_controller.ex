defmodule PetsWeb.PageController do
  use PetsWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: "/login")
  end
end
