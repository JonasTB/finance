defmodule Finance.NumbersTest do

  use ExUnit.Case

  alias Finance.Numbers

  describe "sum/1" do
    test "where there is a file with the given name, returns the sum of numbers" do
      response = Numbers.sum("numbers")

      expected_response = {:ok, %{result: 55}}

      assert response == expected_response
    end

    test "where there is a file with the given name, returns an error" do
      response = Numbers.sum("banana")

      expected_response = {:error, %{message: "Invalid file"}}

      assert response == expected_response
    end
  end
end
