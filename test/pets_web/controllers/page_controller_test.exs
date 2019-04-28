defmodule PetsWeb.PageControllerTest do
  use PetsWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert redirected_to(conn) == "/login"
  end
end
