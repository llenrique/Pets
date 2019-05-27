defmodule Pets.Repo.Migrations.AddPhoneNumberToUsersTable do
  use Ecto.Migration

  def up do
    alter table("users") do
      add :phone, :bigint
    end
  end

  def down do
    alter table("users") do
      remove :phone
    end
  end
end
