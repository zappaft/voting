defmodule VotingWeb.Admin.SessionControllerTest do
  @moduledoc """
  admins session controller tests
  """
  use VotingWeb.ConnCase, async: true
  import Voting.Factory

  describe "create/2" do
    setup %{conn: conn} do
      insert(:admin, name: "John Smith", email: "joao@kk.com")
      %{conn: conn}
    end

    test "returns 200 when admin credentials are valid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/admin/sign_in", %{"email" => "joao@kk.com", "password" => "12345"})

      assert %{"status" => "ok", "data" => %{"name" => "John Smith"}} = json_response(conn, 200)
    end

    test "returns 401 when admin email is invalid", %{conn: conn} do
      conn = post(conn, "/api/v1/admin/sign_in", %{"email" => "jo@kk.com", "password" => "12345"})
      assert %{"status" => "unauthenticated"} = json_response(conn, 401)
    end

    test "returns 401 when admin password is invalid", %{conn: conn} do
      conn = post(conn, "/api/v1/admin/sign_in", %{"email" => "joao@kk.com", "password" => "123"})
      assert %{"status" => "unauthenticated"} = json_response(conn, 401)
    end
  end
end
