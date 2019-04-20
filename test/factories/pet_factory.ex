defmodule Pets.PetFactory do
  alias Pets.Contexts.Pet

  defmacro __using__(_opts) do
    quote do
      def pet_factory do
       %Pet{
         pet_name: "cantest",
         pet_type: "rodent",
         pet_race: "catrace",
         behavior: "dangerous",
         gender: "female",
         user_id: 1
       }
     end

    end
  end
end
