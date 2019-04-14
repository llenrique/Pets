defmodule Pets.Repo.Migrations.AddPetTypeColumnToPetsTable do
  use Ecto.Migration

  def up do
    PetTypeEnum.create_type

    alter table("pets") do
      add :pet_type, PetTypeEnum.type
    end
  end

  def down do
    PetTypeEnum.drop_type

    alter table("pets") do
      remove :pet_type
    end
  end
end
