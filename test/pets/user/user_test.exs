defmodule Pets.UserTest do
  use Pets.DataCase

  alias Pets.Contexts.{UserManager, User}

  import Pets.Factory

  @valid_attrs %{
    first_name: "Test",
    last_name: "Testing",
    username: "test",
    email: "t@est.com",
    password: "tested",
    password_confirmation: "tested",
    gender: "female"
  }

  @invalid_attrs %{
    first_name: "",
    last_name: "Testing",
    email: "",
    password: "tested",
    password_confirmation: "",
    gender: "female"
  }

  test "get_user_by_username/1 returns the user with the matching username" do
    user = insert(:user)
    assert UserManager.get_user_by_username(user.username)
  end

  test "get_user_by_username/1 returns nil when there is not a matching username" do
    assert is_nil(UserManager.get_user_by_username("fail"))
  end

  test "new_invalid" do
    assert {:error, %Ecto.Changeset{}} = UserManager.create(@invalid_attrs)
  end

  test "list/0 returns all users" do
    user = insert(:user)
    assert UserManager.list() == [user]
  end

  test "list_single/1 returns the user with the given id" do
    user = Repo.preload(insert(:user), :pets)
    assert UserManager.list_single(user.id) == user
  end

  test "create/1 returns a blank changeset" do
    {:ok, %User{} = user} = UserManager.create(@valid_attrs)
    assert user.first_name == @valid_attrs.first_name
  end

  test "logical_delete/1 change active field to false" do
    user = insert(:user)
    {:ok, logical_deleted_user} = UserManager.logical_delete(user.id)
    assert logical_deleted_user.active != :true
  end
end
