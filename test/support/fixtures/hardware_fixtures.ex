defmodule Haas.HardwareFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Haas.Hardware` context.
  """

  @doc """
  Generate a hardware_set.
  """
  def hardware_set_fixture(attrs \\ %{}) do
    {:ok, hardware_set} =
      attrs
      |> Enum.into(%{
        available: 42,
        capacity: 42,
        project_id: 42
      })
      |> Haas.Hardware.create_hardware_set()

    hardware_set
  end
end
