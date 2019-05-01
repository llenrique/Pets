defmodule Pets.PetTest do
  use Pets.DataCase
  alias Pets.Contexts.{PetManager, Pet}
  import Pets.Factory

  @valid_attrs %{
    pet_name: "Pet Test",
    pet_race: "Pet Race Testing",
    behavior: "happy",
    gender: "female",
    pet_type: "feline"
  }

  @invalid_attrs %{
    pet_name: "Pet Test",
    pet_race: "",
    behavior: "",
    gender: "female"
  }

  test "new_invalid" do
    assert {:error, %Ecto.Changeset{}} = PetManager.create(@invalid_attrs)
  end

  test "list/0 returns all pets" do
    pet = insert(:pet)
    [element] = PetManager.list()
    assert length([element]) == 1
    assert element.pet_name == pet.pet_name
  end

  test "new/0 returns a blank changeset" do
    user = insert(:user)
    valid_attrs = Map.put(@valid_attrs, :user_id, user.id)
    {:ok, %Pet{} = pet} = PetManager.create(valid_attrs)
    assert pet.pet_name == valid_attrs.pet_name
  end
end
