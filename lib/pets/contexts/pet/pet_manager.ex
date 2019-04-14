defmodule Pets.Contexts.PetManager do
  import Ecto.Query, warn: false

  alias Pets.Repo
  alias Pets.Contexts.Pet

  def list do
    Pet
    |> Repo.all
  end

  def list_single_pet(id) do
    Pet
    |> Repo.get!(id)
  end

  def create(fields \\ %{}) do
    %Pet{}
    |> Pet.changeset(fields)
    |> Repo.insert()
  end
end
