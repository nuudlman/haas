defmodule Haas.HardwareTest do
  use Haas.DataCase

  alias Haas.Hardware

  describe "hardware" do
    alias Haas.Hardware.HardwareSet

    import Haas.HardwareFixtures

    @invalid_attrs %{available: nil, project_id: nil, capacity: nil}

    test "list_hardware/0 returns all hardware" do
      hardware_set = hardware_set_fixture()
      assert Hardware.list_hardware() == [hardware_set]
    end

    test "get_hardware_set!/1 returns the hardware_set with given id" do
      hardware_set = hardware_set_fixture()
      assert Hardware.get_hardware_set!(hardware_set.id) == hardware_set
    end

    test "create_hardware_set/1 with valid data creates a hardware_set" do
      valid_attrs = %{available: 42, project_id: 42, capacity: 42}

      assert {:ok, %HardwareSet{} = hardware_set} = Hardware.create_hardware_set(valid_attrs)
      assert hardware_set.available == 42
      assert hardware_set.project_id == 42
      assert hardware_set.capacity == 42
    end

    test "create_hardware_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hardware.create_hardware_set(@invalid_attrs)
    end

    test "update_hardware_set/2 with valid data updates the hardware_set" do
      hardware_set = hardware_set_fixture()
      update_attrs = %{available: 43, project_id: 43, capacity: 43}

      assert {:ok, %HardwareSet{} = hardware_set} = Hardware.update_hardware_set(hardware_set, update_attrs)
      assert hardware_set.available == 43
      assert hardware_set.project_id == 43
      assert hardware_set.capacity == 43
    end

    test "update_hardware_set/2 with invalid data returns error changeset" do
      hardware_set = hardware_set_fixture()
      assert {:error, %Ecto.Changeset{}} = Hardware.update_hardware_set(hardware_set, @invalid_attrs)
      assert hardware_set == Hardware.get_hardware_set!(hardware_set.id)
    end

    test "delete_hardware_set/1 deletes the hardware_set" do
      hardware_set = hardware_set_fixture()
      assert {:ok, %HardwareSet{}} = Hardware.delete_hardware_set(hardware_set)
      assert_raise Ecto.NoResultsError, fn -> Hardware.get_hardware_set!(hardware_set.id) end
    end

    test "change_hardware_set/1 returns a hardware_set changeset" do
      hardware_set = hardware_set_fixture()
      assert %Ecto.Changeset{} = Hardware.change_hardware_set(hardware_set)
    end
  end
end
