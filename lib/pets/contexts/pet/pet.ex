defmodule Pets.Contexts.Pet do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pets.Contexts.Pet

  @fields [:pet_name, :pet_race, :behavior, :gender, :user_id, :pet_type]
  @required [:pet_name, :pet_race, :behavior, :gender, :user_id, :pet_type]

  schema "pets" do
    field :pet_name, :string
    field :pet_race, :string
    field :behavior, BehaviorEnum
    field :gender, GenderEnum
    field :pet_type, PetTypeEnum
    field :user_id, :integer
    timestamps()
  end

  def changeset(%Pet{} = pet, attrs) do
    pet
    |> cast(attrs, @fields)
    |> validate_required(@required)
  end
end
