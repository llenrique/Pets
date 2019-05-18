defmodule PetsWeb.PetController do
  use PetsWeb, :controller
  alias Pets.Helpers.PetHelper

  @doc """
  Create a empty pet changeset and render a form to create a new pet
  """

  def new(conn, _params) do
    case PetHelper.new do
      {:ok, pet} ->
        user = get_session(conn, :user)

        conn
        |> assign(:pet, pet)
        |> assign(:user, user)
        |> assign(:genders, GenderEnum.__enum_map__())
        |> assign(:behaviors, BehaviorEnum.__enum_map__())
        |> assign(:pet_types, PetTypeEnum.__enum_map__())
        |> render("new.html")
    end
  end

  @doc """
  Persist a new pet in database
  """
  def create(conn, %{"pet" => attrs}) do
    user = get_session(conn, :user)
    case PetHelper.create(user.id, attrs) do
      {:ok, pet} ->

        conn
        |> put_flash(:info, "Pet Created")
        |> redirect(to: Routes.user_pet_path(conn, :show, user.id, pet))
    end
  end

  def show(conn, %{"id" => id}) do
    case PetHelper.show(id) do
      {:ok, pet} ->
        user = get_session(conn, :user)

        conn
        |> assign(:user, user)
        |> assign(:pet, pet)
        |> render("show.html")
    end
  end

  def edit(conn, %{"id" => id}) do
    pet = PetHelper.get_pet(id)
    case PetHelper.set_pet_changeset(pet) do
      {:ok, changeset} ->
        user = get_session(conn, :user)

        conn
        |> assign(:behaviors, BehaviorEnum.__enum_map__())
        |> assign(:pet, pet)
        |> assign(:u_session, user)
        |> assign(:changeset, changeset)
        |> render("edit.html")
    end
  end

  def update(conn, %{"id" => id, "pet" => params}) do
    case PetHelper.update(id, params) do
      {:ok, u_pet} ->
        user = get_session(conn, :user)

        conn
        |> put_flash(:info, "Pet updated")
        |> redirect(to: Routes.user_pet_path(conn, :show, user.id, u_pet.id))
    end
  end

  def delete(conn, %{"id" => id} = params) do
    user = get_session(conn, :user)

    case PetHelper.delete(id) do
      {:ok, _} ->
        conn
        |> redirect(to: Routes.user_path(conn, :show, user.id))
    end
  end
end
