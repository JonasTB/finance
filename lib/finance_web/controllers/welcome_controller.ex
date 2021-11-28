defmodule FinanceWeb.WelcomeController do
  use FinanceWeb, :controller

  alias Finance.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to finance API. Here is your number #{result}"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
