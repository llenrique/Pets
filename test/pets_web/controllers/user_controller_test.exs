defmodule PetsWeb.UserControllerTest do
  use PetsWeb.ConnCase
  import Pets.Factory

  @user_params %{
    first_name: "Test",
    last_name: "Testing",
    username: "test",
    email: "t@est.com",
    password: "tested",
    password_confirmation: "tested",
    gender: "female",
    encrypted_password: "TESTING"
  }

  @valid_update_attrs %{
    first_name: "UpDated",
    last_name: "Utest",
    username: "utest",
    email: "up@dated.com",
    password: "utested",
    password_confirmation: "utested",
    gender: "female",
    encrypted_password: "TESTING"
  }

  test "GET /user/new", %{conn: conn} do
    conn = get(conn, "/user/new")
    assert html_response(conn, 200) =~ "User Signup"
  end

  test "GET /users/:id", %{conn: conn} do
    user = insert(:user)
    conn = get(conn, "/user/#{user.id}")
    assert html_response(conn, 200) =~ user.first_name
  end

  test "POST /user", %{conn: conn} do
    conn = post(conn, "/user", %{"user" => @user_params})
    assert redirected_to(conn) =~ "/login"
  end

  test "DELETE /user/:id", %{conn: conn} do
    user = insert(:user)
    conn = delete(conn, "/user/#{user.id}")
    assert redirected_to(conn) =~ "/login"
  end

  test "GET /user/:id/edit", %{conn: conn} do
    user = insert(:user)
    conn = get(conn, "/user/#{user.id}/edit")
    assert html_response(conn, 200) =~ "Edit: #{user.username}"
  end

  test "UPDATE /user/:id", %{conn: conn} do
    user = insert(:user)
    conn = put(conn, "/user/#{user.id}", %{"user" => @valid_update_attrs})
    assert redirected_to(conn) =~ "/user/#{user.id}"
  end
end
