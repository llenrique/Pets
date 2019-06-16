defmodule Pets.Contexts.Walk do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pets.Contexts.{User, Pet, Walk}

  @fields [:user_id, :pet_id]
  @required [:user_id, :pet_id]

  schema "walks" do
    belongs_to :user, User
    belongs_to :pet, Pet
    timestamps()
  end


  def changeset(%Walk{} = walk, attrs) do
    walk
    |> cast(attrs, @fields)
    |> validate_required(@required)
  end
end
