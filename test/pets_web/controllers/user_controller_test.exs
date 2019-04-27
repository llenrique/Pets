defmodule PetsWeb.UserControllerTest do
  use PetsWeb.ConnCase
  import Pets.Factory

  test "GET /users/new", %{conn: conn} do
    conn = get(conn, "/users/new")
    assert html_response(conn, 200) =~ "User Signup"
  end

  test "GET /users/:id", %{conn: conn} do
    user = insert(:user)
    conn = get(conn, "/users/#{user.id}")
    assert html_response(conn, 200) =~ user.first_name
  end

  test "POST /users", %{conn: conn} do
    user_params = %{
      first_name: "Test",
      last_name: "Testing",
      username: "test",
      email: "t@est.com",
      password: "tested",
      password_confirmation: "tested",
      gender: "female",
      encrypted_password: "TESTING"
    }

    conn = post conn, "/users", %{"user" => user_params}
    assert redirected_to(conn) =~ "/users/"
  end
end
