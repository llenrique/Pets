defmodule Pets.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def up do
    GenderEnum.create_type()

    create table("users") do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :password, :string
      add :birth_date, :date
      add :gender, GenderEnum.type()
      timestamps()
    end
  end

  def down do
    GenderEnum.drop_type()
    drop table("users")
  end
end
