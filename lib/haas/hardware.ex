defmodule Haas.Hardware do
  @moduledoc """
  The Hardware context.
  """

  import Ecto.Query, warn: false
  alias Haas.Repo

  alias Haas.Projects.Project
  alias Haas.Hardware.HardwareSet

  @doc """
  Returns the list of hardware for a project.

  ## Examples

      iex> list_hardware(project)
      [%HardwareSet{}, ...]

  """
  def list_hardware(%Project{} = project) do
    Repo.all(from h in HardwareSet, where: h.project_id == ^project.id)
  end

  @doc """
  Gets a single hardware_set.

  Raises `Ecto.NoResultsError` if the Hardware set does not exist.

  ## Examples

      iex> get_hardware_set!(123)
      %HardwareSet{}

      iex> get_hardware_set!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hardware_set!(id), do: Repo.get!(HardwareSet, id)

  @doc """
  Creates a hardware_set.

  ## Examples

      iex> create_hardware_set(%{field: value})
      {:ok, %HardwareSet{}}

      iex> create_hardware_set(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hardware_set(attrs \\ %{}) do
    %HardwareSet{}
    |> HardwareSet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hardware_set.

  ## Examples

      iex> update_hardware_set(hardware_set, %{field: new_value})
      {:ok, %HardwareSet{}}

      iex> update_hardware_set(hardware_set, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hardware_set(%HardwareSet{} = hardware_set, attrs) do
    hardware_set
    |> HardwareSet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a hardware_set.

  ## Examples

      iex> delete_hardware_set(hardware_set)
      {:ok, %HardwareSet{}}

      iex> delete_hardware_set(hardware_set)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hardware_set(%HardwareSet{} = hardware_set) do
    Repo.delete(hardware_set)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hardware_set changes.

  ## Examples

      iex> change_hardware_set(hardware_set)
      %Ecto.Changeset{data: %HardwareSet{}}

  """
  def change_hardware_set(%HardwareSet{} = hardware_set, attrs \\ %{}) do
    HardwareSet.changeset(hardware_set, attrs)
  end
end
