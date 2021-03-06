defmodule Pets.Repo.Migrations.RemoveBirthDateFromUsersTable do
  use Ecto.Migration

  def up do
    alter table("users") do
      remove :birth_date
    end
  end

  def down do
    alter table("users") do
      add :birth_date, :date
    end
  end
end
