defmodule Pets.Contexts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pets.Contexts.{User, Pet}

  @fields [:first_name, :last_name, :email, :password, :gender, :birth_date]
  @required [:first_name, :last_name, :email, :password, :gender, :birth_date]

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password, :string
    field :gender, :string
    field :birth_date, :date
    has_many :pets, Pet
    timestamps()
  end

  def changeset(%User{}=user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@required)
  end
end
