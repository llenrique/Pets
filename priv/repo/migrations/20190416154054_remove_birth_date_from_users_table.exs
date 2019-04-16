defmodule Pets.Repo.Migrations.RemoveBirthDateFromUsersTable do
  use Ecto.Migration

  def change do
    alter table("users") do
      remove :birth_date
    end
  end
end
