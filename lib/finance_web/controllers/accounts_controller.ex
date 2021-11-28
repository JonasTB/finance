defmodule FinanceWeb.AccountsController do
  use FinanceWeb, :controller

  alias Finance.Accounts.Transactions.Response, as: TransactionResponse
  alias Finance.Account

  action_fallback FinanceWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Finance.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Finance.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    task = Task.async(fn -> Finance.transaction(params) end)
    with {:ok, %TransactionResponse{} = transaction} <- Task.await(task) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
