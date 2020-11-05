defmodule Voting.CreateAdminTest do
  use Voting.DataCase, async: true
  alias Voting.{Admin, CreateAdmin}

  describe "run/1" do
    test "returns a struct when params are valid" do
      params = %{name: "foo", email: "helo@helo.com", password: "123123"}
      assert {:ok, %Admin{} = admin} = CreateAdmin.run(params)
      assert admin.name == "foo"
      assert admin.email == "helo@helo.com"
      refute admin.password_hash == "123123"
    end

    test "returns error when name is missing" do
      params = %{name: "", email: "helo@helo.com", password: "123123"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when email is missing" do
      params = %{name: "foo", email: "", password: "123123"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{email: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when password is missing" do
      params = %{name: "foo", email: "helo@helo.com", password: ""}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{password: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
