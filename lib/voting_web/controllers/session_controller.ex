defmodule VotingWeb.Admin.SessionController do
  @moduledoc """
  session controller
  """

  use VotingWeb, :controller
  alias Voting.SigninAdmin

  def create(conn, %{"email" => email, "password" => password}) do
    case SigninAdmin.run(email, password) do
      {:ok, admin} ->
        render(conn, "session.json", %{admin: admin})

      {:error, _} ->
        conn
        |> put_status(401)
        |> json(%{status: "unauthenticated"})
    end
  end
end
