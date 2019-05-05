defmodule PetsWeb.PetController do
  use PetsWeb, :controller
  alias Pets.Contexts.PetManager

  def new(conn, _params) do
    pet = PetManager.new()
    user = get_session(conn, :user)
    conn
    |> assign(:pet, pet)
    |> assign(:user, user)
    |> render("new.html")
  end

  def create(conn, %{"pet" => attrs}) do
    user = get_session(conn, :user)
    attrs = Map.put(attrs, "user_id", user.id)
    {:ok, pet} = PetManager.create(attrs)

    conn
    |> put_flash(:info, "Pet Created")
    |> redirect(to: Routes.user_pet_path(conn, :show, user.id, pet))
  end

  def show(conn, %{"id" => id}) do
    pet = PetManager.list_single(id)

    conn
    |> render("show.html", pet: pet)
  end
end
