defmodule Pets.UserFactory do
  alias Pets.Contexts.User

  defmacro __using__(_opts) do
    quote do
      def user_factory do
        %User{
          first_name: "Test",
          username: "test",
          last_name: "Testing",
          email: sequence(:email, &"email-#{&1}@example.com"),
          encrypted_password: "abc1234",
          gender: "female",
          phone: 5512345678,
          user_type: :owner
        }
      end
    end
  end
end
