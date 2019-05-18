defmodule PetsWeb.PetView do
  use PetsWeb, :view

  def lists_enums(list) do
    list
    |> List.insert_at(0, "")
  end
end
