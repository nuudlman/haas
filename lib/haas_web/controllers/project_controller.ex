defmodule HaasWeb.ProjectController do
  use HaasWeb, :controller

  alias Haas.Projects
  alias Haas.Projects.Project
  alias Haas.Hardware

  def index(conn, _params) do
    projects = Projects.list_projects(conn.assigns.current_user)
    render(conn, :index, projects: projects)
  end

  def new(conn, _params) do
    changeset = Projects.change_project(%Project{})
    render(conn, :new, changeset: changeset, current_user: conn.assigns.current_user)
  end

  def create(conn, %{"project" => project_params}) do
    case Projects.create_project(project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: ~p"/projects/#{project}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset, current_user: conn.assigns.current_user)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    hardware = Hardware.list_hardware(project)
    render(conn, :show, project: project, hardware: hardware)
  end

  def edit(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    changeset = Projects.change_project(project)

    render(conn, :edit,
      project: project,
      changeset: changeset,
      current_user: conn.assigns.current_user
    )
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Projects.get_project!(id)

    case Projects.update_project(project, project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project updated successfully.")
        |> redirect(to: ~p"/projects/#{project}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit,
          project: project,
          changeset: changeset,
          current_user: conn.assigns.current_user
        )
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    {:ok, _project} = Projects.delete_project(project)

    conn
    |> put_flash(:info, "Project deleted successfully.")
    |> redirect(to: ~p"/projects")
  end
end
