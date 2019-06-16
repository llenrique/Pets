defmodule Pets.Contexts.WalkManager do
  import Ecto.Query, warn: :false

  alias Pets.Repo
  alias Pets.Contexts.Walk

  def create(fields \\ %{}) do
    %Walk{}
    |> Walk.changeset(fields)
    |> Repo.insert()
  end

  def list_all() do
    Walk
    |> preload(:user)
    |> preload(:pet)
    |> Repo.all()
  end
end
