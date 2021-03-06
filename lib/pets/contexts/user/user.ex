defmodule Pets.Contexts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pets.Contexts.{User, Pet}

  @fields [
    :first_name, :last_name, :email,
    :password, :password_confirmation,
    :gender, :username, :phone, :user_type
  ]

  @required [
    :first_name, :last_name, :email,
    :encrypted_password, :gender, :username,
    :phone, :user_type
  ]

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :encrypted_password, :string

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    field :gender, GenderEnum
    field :username, :string
    has_many :pets, Pet
    field :active, :boolean, default: true
    field :phone, :integer, size: 10
    field :user_type, UserTypeEnum
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
    |> validate_confirmation(:password, message: "passwords fields does not match")
    |> encrypt_password()
    |> validate_required(@required)
  end

  def active_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:active])
  end
end
