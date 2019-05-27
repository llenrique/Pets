defmodule Pets.Repo.Migrations.AddUserTypeColumnToUsersTable do
  use Ecto.Migration

  def up do
    alter table("users") do
      add :user_type, :string
    end
  end

  def down do
    alter table("users") do
      remove :user_type
    end
  end
end
