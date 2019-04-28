defmodule Pets.Repo.Migrations.AddPetsTable do
  use Ecto.Migration

  def up do
    create table("pets") do
      add :pet_name, :string
      add :pet_race, :string
      add :behavior, :string
      add :birth_date, :date
      add :gender, :string
      add :user_id, references(:users)
      timestamps()
    end

    create index(:pets, [:user_id])
  end

  def down do
    drop table("pets")
  end
end
