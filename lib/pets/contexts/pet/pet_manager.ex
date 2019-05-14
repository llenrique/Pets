defmodule Pets.Contexts.PetManager do
  import Ecto.Query, warn: false

  alias Pets.Repo
  alias Pets.Contexts.Pet

  def new, do: Pet.changeset(%Pet{}, %{})

  def renew(pet), do: Pet.changeset(pet, %{})

  def update(pet, params) do
    pet
    |> Pet.update_changeset(params)
    |> Repo.update()
  end

  def create(fields \\ %{}) do
    %Pet{}
    |> Pet.changeset(fields)
    |> Repo.insert()
  end

  def list_single(id) do
    Pet
    |> Repo.get!(id)
  end

  def list do
    Pet
    |> Repo.all()
  end

  def logical_delete(id) do
    pet = get_pet_by_id(id)

    pet
    |> Pet.active_changeset(%{"active" => false})
    |> Repo.update()
  end

  def get_pet_by_id(id) do
    Pet
    |> where([p], p.active != false)
    |> Repo.get!(id)
  end
end
