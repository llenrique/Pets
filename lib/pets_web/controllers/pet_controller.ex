defmodule PetsWeb.PetController do
  use PetsWeb, :controller
  alias Pets.Contexts.PetManager

  @doc """
  Create a empty pet changeset and render a form to create a new pet
  """

  def new(conn, _params) do
    pet = PetManager.new()
    user = get_session(conn, :user)
    conn
    |> assign(:pet, pet)
    |> assign(:user, user)
    |> render("new.html")
  end

  @doc """
  Persist a new pet in database
  """
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

  def edit(conn, %{"id" => id}) do
    pet = PetManager.list_single(id)
    changeset = PetManager.renew(pet)
    user = get_session(conn, :user)

    conn
    |> assign(:pet, pet)
    |> assign(:u_session, user)
    |> assign(:changeset, changeset)
    |> render("edit.html")
  end

  def update(conn, %{"id" => id, "pet" => params}) do
    pet = PetManager.list_single(id)
    user = get_session(conn, :user)

    case PetManager.update(pet, params) do
      {:ok, u_pet} ->
        conn
        |> put_flash(:info, "Pet updated")
        |> redirect(to: Routes.user_pet_path(conn, :show, user.id, u_pet.id))
    end
  end
end
