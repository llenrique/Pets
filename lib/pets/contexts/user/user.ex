defmodule Pets.Contexts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pets.Contexts.{User, Pet}

  @fields [:first_name, :last_name, :email, :password, :password_confirmation, :gender]
  @required [:first_name, :last_name, :email, :gender, :encrypted_password]

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :encrypted_password, :string

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    field :gender, GenderEnum
    has_many :pets, Pet
    timestamps()
  end

  def encrypt_password(changeset) do
    with password when not is_nil(password) <- get_change(changeset, :password) do
      put_change(changeset, :encrypted_password, Bcrypt.hash_pwd_salt(password))
    else
      _ -> changeset
    end
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_confirmation(:password, message: "paswords fields noes not match")
    |> encrypt_password()
    |> validate_required(@required)
  end
end
