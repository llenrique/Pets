defmodule PetsWeb.PetController do
  use PetsWeb, :controller
  alias Pets.Contexts.PetManager

  def new(conn, _params) do
    pet = PetManager.new()

    conn
    |> render("new.html", pet: pet)
  end

  def create(conn, %{"pet" => attrs}) do
    user = get_session(conn, :user)
    attrs = Map.put(attrs, "user_id", user.id)
    {:ok, pet} = PetManager.create(attrs)
    conn
    |> put_flash(:info, "Pet Created")
    |> redirect(to: Routes.pet_path(conn, :show, pet))
  end

  def show(conn, %{"id" => id}) do
    pet = PetManager.list_single(id)

    conn
    |> render("show.html", pet: pet)
  end
end
