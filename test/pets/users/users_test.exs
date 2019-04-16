defmodule Pets.UserTest do
  use Pets.DataCase

  alias Pets.Contexts.UserManager

  describe "users" do
    @valid_attrs %{first_name: "Test", last_name: "Testing", email: "t@est.com", password: "tested", gender: "female", birth_date: ~D[2000-10-10], active: true}

    def user_fixture(attrs \\ %{}) do
      with create_attrs <- Map.merge(@valid_attrs, attrs),
           {:ok, user} <- UserManager.create_user(create_attrs)
      do
        user
      end
    end

    test "list/0 returns all users" do
      user = user_fixture()
      assert UserManager.list() == [user]
    end

    test "list_single_user/1 returns the user with the given id" do
      user = user_fixture()
      assert UserManager.list_single_user(user.id) == user
    end

    test "new_user/0 returns a blank changeset" do
      changeset = UserManager.new_user()
      assert changeset.__struct__ == Ecto.Changeset
    end
  end
end
