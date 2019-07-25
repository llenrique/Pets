defmodule Pets.Repo.Migrations.AddPhotoColumnToUsersTable do
  use Ecto.Migration

  def up do
    alter table("users") do
      add :photo, :string
    end
  end

  def down do
    alter table("users") do
      remove :photo
    end
  end
end
