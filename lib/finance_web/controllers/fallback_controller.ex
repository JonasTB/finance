defmodule FinanceWeb.FallbackController do
  use FinanceWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(FinanceWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
