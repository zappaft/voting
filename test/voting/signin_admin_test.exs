defmodule Voting.SigninAdminTest do
  use Voting.DataCase, async: true

  import Voting.Factory
  alias Voting.{Admin, SigninAdmin}

  describe "run/2" do
    setup do
      insert(:admin)
      :ok
    end

    test "returns ok when email and password matches" do
      assert {:ok, %Admin{}} = SigninAdmin.run("email@example.com", "12345")
    end

    test "returns error when there is no admin with this email" do
      assert {:error, :email_or_password_invalid} =
               SigninAdmin.run("invalid@example.com", "12345")
    end

    test "returns error when the password is invalid" do
      assert {:error, :email_or_password_invalid} = SigninAdmin.run("email@example.com", "1234")
    end
  end
end
