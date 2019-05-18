defmodule Pets.Helpers.PetHelper do
  alias Pets.Contexts.PetManager

  def new, do: {:ok, PetManager.new}

  def create(user_id, attrs) do
    attrs = Map.put(attrs, "user_id", user_id)
    PetManager.create(attrs)
  end

  def show(id) do
    {:ok, PetManager.list_single(id)}
  end

  def set_pet_changeset(pet) do
    {:ok, PetManager.renew(pet)}
  end

  def update(id, params) do
    pet = PetManager.list_single(id)
    PetManager.update(pet, params)
  end

  def delete(id) do
    PetManager.logical_delete(id)
  end
end
