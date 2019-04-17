defmodule Pets.UserFactory do

  alias Pets.Contexts.User

  defmacro __using__(_opts) do
    quote do
      def user_factory do
       %User{
         first_name: "Test",
         last_name: "Testing",
         email: "t@est.com",
         password: "tested",
         gender: "female"
       }
     end

    end
  end
end
