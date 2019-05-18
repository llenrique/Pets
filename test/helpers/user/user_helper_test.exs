defmodule Pets.PetTestHelper do
  use Pets.DataCase
  alias Pets.Helpers.UserHelper
  import Pets.Factory

  @create_attrs %{
    first_name: "Test",
    last_name: "Testing",
    username: "test",
    email: "t@est.com",
    password: "tested",
    password_confirmation: "tested",
    gender: "female",
    encrypted_password: "TESTING"
  }

  @update_attrs %{
    first_name: "Tester",
    last_name: "Testing",
    username: "tester",
    email: "t@ester.com",
    password: "tested",
    password_confirmation: "tested",
    gender: "female",
    encrypted_password: "TESTING"
  }

  test "new/0 return a blank changeset" do
    {:ok, user} = UserHelper.new

    assert user.valid? == :false
  end

  test "create/1 create a new user" do
    {:ok, user} = UserHelper.create(@create_attrs)
    assert user.first_name == @create_attrs.first_name
  end

  test "delete/1 logicatl delete a user" do
    user = insert(:user)
    {:ok, logical_deleted_user} = UserHelper.delete(user.id)

    assert logical_deleted_user.active == :false
  end

  test "list_single/1 return one user fom database" do
    user = insert(:user)
    {:ok, u} = UserHelper.show(user.id)
    assert length([u]) == 1
  end

  test "edit/1 return a valid changeset" do
    user = insert(:user)
    {:ok, editable} = UserHelper.edit(user.id)

    assert editable.valid? == :true
  end

  test "update/2 update a user" do
    user = insert(:user)
    {:ok, u_user} = UserHelper.update(user.id, @update_attrs)

    assert u_user.first_name != user.first_name
    assert u_user.username != user.username
  end
end
