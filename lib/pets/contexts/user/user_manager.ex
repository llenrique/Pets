defmodule Pets.Contexts.UserManager do
  import Ecto.Query, warn: false

  alias Pets.Repo
  alias Pets.Contexts.User

  def list, do: Repo.all(User)

  @spec list_single(integer) :: [%User{}]
  def list_single(id) do
    User
    |> preload(:pets)
    |> Repo.get!(id)
  end

  def new, do: User.changeset(%User{}, %{})

  def create(fields \\ %{}) do
    %User{}
    |> User.changeset(fields)
    |> Repo.insert()
  end

  def get_user_by_username(username) do
    User
    |> Repo.get_by(username: username)
  end
end
