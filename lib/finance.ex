defmodule Finance do
  alias Finance.Users.Create, as: UserCreate

  alias Finance.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
