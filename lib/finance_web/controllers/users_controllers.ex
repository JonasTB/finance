defmodule FinanceWeb.UsersController do
  use FinanceWeb, :controller

  alias Finance.User

  action_fallback FinanceWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Finance.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
