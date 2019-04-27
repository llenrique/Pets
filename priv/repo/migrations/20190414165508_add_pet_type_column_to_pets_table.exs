defmodule Pets.Repo.Migrations.AddPetTypeColumnToPetsTable do
  use Ecto.Migration

  def up do
    alter table("pets") do
      add :pet_type, :string
    end
  end

  def down do
    alter table("pets") do
      remove :pet_type
    end
  end
end
