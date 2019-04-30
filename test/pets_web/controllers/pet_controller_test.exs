defmodule PetsWeb.PetsControllerTest do
  use PetsWeb.ConnCase
  import Pets.Factory

  @valid_attrs %{
    pet_name: "PetTest",
    pet_race: "PetRace",
    behavior: "shy",
    gender: "male",
    pet_type: "canine"
  }

  test "GET /pet/new", %{conn: conn} do
    conn = get conn, "/pet/new"
    assert html_response(conn, 200) =~ "Add Pet"
  end

  test "GET /pet/:id", %{conn: conn} do
    pet = insert(:pet)
    conn = get conn, "pet/#{pet.id}"
    assert html_response(conn, 200) =~ pet.pet_name
  end
end
