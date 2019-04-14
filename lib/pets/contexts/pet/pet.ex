defmodule Pets.Contexts.Pet do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pets.Contexts.Pet

  @fields [:pet_name, :pet_race, :behavior, :birth_date, :gender, :user_id, :pet_type]
  @required [:pet_name, :pet_race, :behavior, :birth_date, :gender, :user_id, :pet_type]

  schema "pets" do
    field :pet_name, :string
    field :pet_race, :string
    field :behavior, :string
    field :birth_date, :date
    field :gender, :string
    field :pet_type, :string
    field :user_id, :integer
    timestamps()
  end

  def changeset(%Pet{} = pet, attrs) do
    pet
    |> cast(attrs, @fields)
    |> validate_required(@required)
  end
end
