defmodule HaasWeb.HardwareSetController do
  use HaasWeb, :controller

  alias Haas.Hardware
  alias Haas.Hardware.HardwareSet

  def index(conn, %{"project_id" => project_id}) do
    hardware = Hardware.list_hardware(project_id)
    render(conn, :index, hardware: hardware)
  end

  def new(conn, _params) do
    changeset = Hardware.change_hardware_set(%HardwareSet{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"project_id" => project_id, "hardware_set" => hardware_set_params}) do
    case Hardware.create_hardware_set(hardware_set_params) do
      {:ok, hardware_set} ->
        conn
        |> put_flash(:info, "Hardware set created successfully.")
        |> redirect(to: ~p"/projects/#{project_id}/hardware/#{hardware_set}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"project_id" => project_id, "id" => id}) do
    hardware_set = Hardware.get_hardware_set!(id)
    render(conn, :show, hardware_set: hardware_set)
  end

  def edit(conn, %{"project_id" => project_id, "id" => id}) do
    hardware_set = Hardware.get_hardware_set!(id)
    changeset = Hardware.change_hardware_set(hardware_set)
    render(conn, :edit, hardware_set: hardware_set, changeset: changeset)
  end

  def update(conn, %{"project_id" => project_id, "id" => id, "hardware_set" => hardware_set_params}) do
    hardware_set = Hardware.get_hardware_set!(id)

    case Hardware.update_hardware_set(hardware_set, hardware_set_params) do
      {:ok, hardware_set} ->
        conn
        |> put_flash(:info, "Hardware set updated successfully.")
        |> redirect(to: ~p"/projects/#{project_id}/hardware/#{hardware_set}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, hardware_set: hardware_set, changeset: changeset)
    end
  end

  def delete(conn, %{"project_id" => project_id, "id" => id}) do
    hardware_set = Hardware.get_hardware_set!(id)
    {:ok, _hardware_set} = Hardware.delete_hardware_set(hardware_set)

    conn
    |> put_flash(:info, "Hardware set deleted successfully.")
    |> redirect(to: ~p"/projects/#{project_id}/hardware")
  end
end
