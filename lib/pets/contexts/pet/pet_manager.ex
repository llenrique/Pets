defmodule Pets.Contexts.PetManager do
  import Ecto.Query, warn: false

  alias Pets.Repo
  alias Pets.Contexts.Pet

  def list do
    Pet
    |> Repo.all
  end
end
