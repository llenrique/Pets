defmodule PetsWeb.UserView do
  use PetsWeb, :view

  def lists_enums(enum) do
    enum
    |> List.insert_at(0, "")
  end
end
