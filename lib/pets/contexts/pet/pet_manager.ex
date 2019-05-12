defmodule Pets.Contexts.PetManager do
  import Ecto.Query, warn: false

  alias Pets.Repo
  alias Pets.Contexts.Pet

  def new, do: Pet.changeset(%Pet{}, %{})

  def renew(pet), do: Pet.changeset(pet, %{})

  def update(pet, params) do
    pet
    |> Pet.update_changeset(params)
    |> Repo.update
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
end
