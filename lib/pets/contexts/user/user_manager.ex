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

  def logical_delete(id) do
    user = get_user_by_id(id)
    change = User.active_changeset(user, %{"active" => false})
    change
    |> Repo.update
  end


  defp get_user_by_id(id) do
    User
    |> Repo.get!(id)
  end
end
