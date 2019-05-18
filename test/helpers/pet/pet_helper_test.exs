defmodule Pets.PetHelperTest do
  use Pets.DataCase
  alias Pets.Helpers.PetHelper
  import Pets.Factory

  @create_attrs %{
    "pet_name" => "Pet Test",
    "pet_race" => "Pet Race Testing",
    "behavior" => "happy",
    "gender" => "female",
    "pet_type" => "feline"
  }

  @update_attrs %{
    "pet_name" => "Pet Tested",
    "pet_race" => "Pet Race Testing",
    "behavior" => "anger",
    "gender" => "female",
    "pet_type" => "canine"
  }

  test "new/0 return a blank changeset" do
    {:ok, pet} = PetHelper.new

    assert pet.valid? == :false
  end

  test "create/2 create a new pet for a user" do
    user = insert(:user)
    {:ok, pet} = PetHelper.create(user.id, @create_attrs)

    assert pet.user_id == user.id
  end

  test "show/1 return a pet" do
    pet = insert(:pet)
    {:ok, p} = PetHelper.show(pet.id)

    assert length([p]) == 1
  end

  test "set_pet_changeset/1 return a valid pet changeset" do
    pet = insert(:pet)
    {:ok, changeset} = PetHelper.set_pet_changeset(pet)

    assert changeset.valid? == :true
  end

  test "update/2 update a pet" do
    pet = insert(:pet)
    {:ok, u_pet} = PetHelper.update(pet.id, @update_attrs)

    assert u_pet.behavior != pet.behavior
    assert u_pet.pet_name == pet.pet_name
  end

  test "delete/1 logical delete a pet" do
    pet = insert(:pet)
    {:ok, deleted_pet} = PetHelper.delete(pet.id)

    assert deleted_pet.active == :false
  end
end
