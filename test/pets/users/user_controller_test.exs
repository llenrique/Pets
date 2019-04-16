defmodule PetsWeb.UserControllerTest do
  use PetsWeb.ConnCase

  test "GET /users/new", %{conn: conn} do
    conn = get(conn, "/users/new")
    assert html_response(conn, 200) =~ "User Signup"
  end

  test "GET /user/:id", %{conn: conn} do
    with {:ok, user} <-
           Pets.Contexts.UserManager.create_user(%{
             first_name: "Test",
             last_name: "Testing",
             email: "t@est.com",
             password: "tested",
             gender: "female"
           }) do
      conn = get(conn, "/user/#{user.id}")
      assert html_response(conn, 200) =~ user.first_name
    else
      _ -> assert false
    end
  end

  test "POST /users", %{conn: conn} do
    user_params = %{
      first_name: "Test",
      last_name: "Testing",
      email: "t@est.com",
      password: "tested",
      gender: "female"
    }

    conn = post conn, "/users", %{"user" => user_params}
    assert redirected_to(conn) =~ "/user/"
  end
end
