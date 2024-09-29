defmodule Haas.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Haas.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name"
      })
      |> Haas.Projects.create_project()

    project
  end
end
