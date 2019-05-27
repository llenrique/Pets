defmodule PetsWeb.SessionControllerTest do
  use PetsWeb.ConnCase
  alias Pets.Contexts.UserManager

  @valid_create_params %{
    first_name: "Test",
    last_name: "Testing",
    username: "test",
    email: "t@est.com",
    password: "tested",
    password_confirmation: "tested",
    gender: "female",
    phone: 5512345678,
    user_type: :walker
  }

  setup do
    conn = build_conn()
    {:ok, user} = UserManager.create(@valid_create_params)
    {:ok, conn: conn, user: user}
  end

  test "GET /login", %{conn: conn} do
    conn = get(conn, "/login")
    assert html_response(conn, 200) =~ "Login"
  end

  test "POST /sessions (with valid data)", %{conn: conn, user: user} do
    conn = post conn, "/sessions", %{username: user.username, password: "tested"}
    assert redirected_to(conn) == "/user/#{user.id}"
    assert Plug.Conn.get_session(conn, :user)
  end

  test "POST /sessions (with invalid data)", %{conn: conn, user: user} do
    conn = post conn, "/sessions", %{username: user.username, password: "fail"}
    assert html_response(conn, 200)
    assert is_nil(Plug.Conn.get_session(conn, :user))
  end
end
