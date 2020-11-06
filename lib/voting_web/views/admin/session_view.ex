defmodule VotingWeb.Admin.SessionView do
  @moduledoc """
  admin session view
  """

  use VotingWeb, :view

  def render("session.json", %{admin: admin}) do
    %{
      status: "ok",
      data: %{
        name: admin.name
      }
    }
  end
end
