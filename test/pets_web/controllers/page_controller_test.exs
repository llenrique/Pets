defmodule PetsWeb.PageControllerTest do
  use PetsWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Paseadores"
  end
end
