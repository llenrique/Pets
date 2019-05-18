defmodule PetsWeb.UserView do
  use PetsWeb, :view

  def genders(genders) do
    genders
    |> List.insert_at(0, "")
  end
end
