defmodule Pets.Factory do
  use ExMachina.Ecto, repo: Pets.Repo

  use Pets.UserFactory
  use Pets.PetFactory
end
