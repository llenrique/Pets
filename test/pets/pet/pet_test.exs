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

  @update_attrs %{
    behavior: :shy,
    pet_race: "persian"
  }

  test "new/0 returns a blank changeset" do
    user = insert(:user)
    valid_attrs = Map.put(@valid_attrs, :user_id, user.id)
    {:ok, %Pet{} = pet} = PetManager.create(valid_attrs)
    assert pet.pet_name == valid_attrs.pet_name
  end

  test "new_invalid" do
    assert {:error, %Ecto.Changeset{}} = PetManager.create(@invalid_attrs)
  end

  test "list/0 returns all pets" do
    pet = insert(:pet)
    [element] = PetManager.list()
    assert length([element]) == 1
    assert element.pet_name == pet.pet_name
  end

  test "list_single/1 returns a pet by id" do
    pet = insert(:pet)
    element = PetManager.list_single(pet.id)
    assert length([element]) == 1
    assert element.id == pet.id
  end

  test "update/2 update and existing pet" do
    pet = insert(:pet)
    {:ok, u_pet} = PetManager.update(pet, @update_attrs)
    assert u_pet.behavior == @update_attrs.behavior
  end

  test "logical_delete/1 change active field to false" do
    pet = insert(:pet)
    {:ok, logical_deleted_pet} = PetManager.logical_delete(pet.id)
    assert logical_deleted_pet.active != pet.active
  end
end
