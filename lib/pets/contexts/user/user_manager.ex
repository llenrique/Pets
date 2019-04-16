defmodule Pets.Contexts.UserManager do
  import Ecto.Query, warn: false

  alias Pets.Repo
  alias Pets.Contexts.User

  def list, do: Repo.all(User)

  def list_preload_pets do
    User
    |> preload(:pets)
    |> Repo.all()
  end

  def list_single_user(id) do
    User
    |> Repo.get!(id)
  end

  def new_user(), do: User.changeset(%User{}, %{})

  def create_user(fields \\ %{}) do
    %User{}
    |> User.changeset(fields)
    |> Repo.insert()
  end
end
