defmodule Pets.Contexts.UserManager do
  import Ecto.Query, warn: false

  alias Pets.Repo
  alias Pets.Contexts.User

  def list, do: Repo.all(User)

  @spec list_single(integer) :: [%User{}]
  def list_single(id) do
    User
    |> preload(:pets)
    |> where([u], u.active != :false)
    |> Repo.get!(id)
  end

  def new, do: User.changeset(%User{}, %{})

  def renew(user), do: User.changeset(user, %{})

  def create(fields \\ %{}) do
    %User{}
    |> User.changeset(fields)
    |> Repo.insert()
  end

  def get_user_by_username(username) do
    User
    |> where([u], u.active != :false)
    |> Repo.get_by(username: username)
  end

  def logical_delete(id) do
    user = get_user_by_id(id)

    user
    |> User.active_changeset(%{"active" => :false})
    |> Repo.update()
  end

  def get_user_by_id(id) do
    User
    |> where([d], d.active != :false)
    |> Repo.get!(id)
  end

  def update(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update
  end
end
