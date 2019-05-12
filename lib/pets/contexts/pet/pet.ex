defmodule Pets.Contexts.Pet do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pets.Contexts.{Pet, User}

  @fields [:pet_name, :pet_race, :behavior, :gender, :pet_type, :user_id]
  @required [:pet_name, :pet_race, :behavior, :gender, :pet_type, :user_id]

  schema "pets" do
    field :pet_name, :string
    field :pet_race, :string
    field :behavior, BehaviorEnum
    field :gender, GenderEnum
    field :pet_type, PetTypeEnum
    belongs_to :user, User
    timestamps()
  end

  def changeset(%Pet{} = pet, attrs) do
    pet
    |> cast(attrs, @fields)
    |> foreign_key_constraint(:user_id)
    |> validate_required(@required)
  end

  def update_changeset(%Pet{} = pet, attrs) do
    pet
    |> cast(attrs, [:behavior, :pet_race])
  end
end
