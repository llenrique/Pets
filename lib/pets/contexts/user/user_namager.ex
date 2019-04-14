defmodule Pets.Contexts.UserManager do
  import Ecto.Query, warn: false

  alias Pets.Repo
  alias Pets.Contexts.User


  def list do
    User
    |> Repo.all()
  end

  def list_preload_pets do
    User
    |> preload(:pets)
    |> Repo.all()
  end

  def list_single_user(id) do
    User
    |> preload(:pets)
    |> Repo.get!(id)
  end

  def create(fields \\ %{}) do
    %User{}
    |> User.changeset(fields)
    |> Repo.insert()
  end

end
