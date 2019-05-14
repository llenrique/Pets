defmodule Pets.Repo.Migrations.AddActiveColumnToPetsTable do
  use Ecto.Migration

  def up do
    alter table("pets") do
      add :active, :boolean, default: :true
    end
  end

  def down do
    alter table("pets") do
      remove :active
    end
  end
end
