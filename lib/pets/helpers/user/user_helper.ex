defmodule Pets.Helpers.UserHelper do
  alias Pets.Contexts.UserManager

  def new, do: {:ok, UserManager.new()}

  def create(attrs) do
    UserManager.create(attrs)
  end

  def delete(id) do
    UserManager.logical_delete(id)
  end

  def show(id) do
    {:ok, UserManager.list_single(id)}
  end

  def edit(id) do
    user = UserManager.get_user_by_id(id)
    {:ok, UserManager.renew(user)}
  end

  def update(user_id, attrs) do
    user = UserManager.get_user_by_id(user_id)
    UserManager.update(user, attrs)
  end
end
