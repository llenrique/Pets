defmodule Pets.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def up do
    create table("users") do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :encrypted_password, :string
      add :birth_date, :date
      add :gender, :string
      timestamps()
    end
  end

  def down do
    drop table("users")
  end
end
