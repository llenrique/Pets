defmodule Pets.PetTest do
  use Pets.DataCase
  alias Pets.Contexts.{PetManager}
  # import Pets.Factory

  # @valid_attrs %{
  #   pet_name: "Pet Test",
  #   pet_race: "Pet Race Testing",
  #   behavior: "happy",
  #   gender: "female",
  #   pet_type: "feline",
  #   user_id: 2
  # }

  @invalid_attrs %{
    pet_name: "Pet Test",
    pet_race: "",
    behavior: "",
    gender: "female",
    pet_type: "",
    user_id: 2
  }

  test "new_invalid" do
    assert {:error, %Ecto.Changeset{}} = PetManager.create(@invalid_attrs)
  end

  # test "list/0 returns all pets" do
  #   pet = insert(:pet)
  #   assert PetManager.list() == [pet]
  # end
  #
  # test "new/0 returns a blank changeset" do
  #   {:ok, %Pet{} = pet} = PetManager.create(@valid_attrs)
  #   assert pet.pet_name == @valid_attrs.first_name
  # end
end
