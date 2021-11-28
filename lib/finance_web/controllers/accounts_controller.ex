defmodule FinanceWeb.AccountsController do
  use FinanceWeb, :controller

  alias Finance.Account

  action_fallback FinanceWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Finance.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
