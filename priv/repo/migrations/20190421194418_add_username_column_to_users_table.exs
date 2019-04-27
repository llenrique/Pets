defmodule Pets.Repo.Migrations.AddUsernameColumnToUsersTable do
  use Ecto.Migration

  def up do
    alter table("users") do
      add :username, :string
    end

    create unique_index(:users, [:username])
  end

  def down do
    alter table("users") do
      remove :username
    end
  end
end
