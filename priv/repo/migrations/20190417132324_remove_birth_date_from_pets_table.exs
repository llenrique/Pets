defmodule Pets.Repo.Migrations.RemoveBirthDateFromPetsTable do
  use Ecto.Migration

  def up do
    alter table("pets") do
      remove :birth_date
    end
  end

  def down do
    alter table("pets") do
      add :birth_date, :date
    end
  end
end
