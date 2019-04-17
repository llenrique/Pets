defmodule Pets.UserTest do
  use Pets.DataCase

  alias Pets.Contexts.{UserManager, User}

  import Pets.Factory

  @valid_attrs %{
    first_name: "Test",
    last_name: "Testing",
    email: "t@est.com",
    password: "tested",
    gender: "female"
  }

  @invalid_attrs %{
    first_name: "",
    last_name: "Testing",
    email: "",
    password: "tested",
    gender: "female"
  }

  test "new_invalid" do
    assert {:error, %Ecto.Changeset{}} = UserManager.create(@invalid_attrs)
  end

  test "list/0 returns all users" do
    user = insert(:user)
    assert UserManager.list() == [user]
  end

  test "list_single/1 returns the user with the given id" do
    user = insert(:user)
    assert UserManager.list_single(user.id) == user
  end

  test "new/0 returns a blank changeset" do
    {:ok, %User{} = user} = UserManager.create(@valid_attrs)
    assert user.first_name == @valid_attrs.first_name
  end
end
