defmodule Pets.Repo.Migrations.AddWalksTable do
  use Ecto.Migration

  def up do
    create table("walks") do
      add :user_id, references(:users)
      add :pet_id, references(:pets)

      timestamps()
    end
  end

  def down do
    drop table("walks")
  end
end
