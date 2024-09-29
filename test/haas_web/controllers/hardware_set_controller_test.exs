defmodule HaasWeb.HardwareSetControllerTest do
  use HaasWeb.ConnCase

  import Haas.HardwareFixtures

  @create_attrs %{available: 42, project_id: 42, capacity: 42}
  @update_attrs %{available: 43, project_id: 43, capacity: 43}
  @invalid_attrs %{available: nil, project_id: nil, capacity: nil}

  describe "index" do
    test "lists all hardware", %{conn: conn} do
      conn = get(conn, ~p"/hardware")
      assert html_response(conn, 200) =~ "Listing Hardware"
    end
  end

  describe "new hardware_set" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/hardware/new")
      assert html_response(conn, 200) =~ "New Hardware set"
    end
  end

  describe "create hardware_set" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/hardware", hardware_set: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/hardware/#{id}"

      conn = get(conn, ~p"/hardware/#{id}")
      assert html_response(conn, 200) =~ "Hardware set #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/hardware", hardware_set: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Hardware set"
    end
  end

  describe "edit hardware_set" do
    setup [:create_hardware_set]

    test "renders form for editing chosen hardware_set", %{conn: conn, hardware_set: hardware_set} do
      conn = get(conn, ~p"/hardware/#{hardware_set}/edit")
      assert html_response(conn, 200) =~ "Edit Hardware set"
    end
  end

  describe "update hardware_set" do
    setup [:create_hardware_set]

    test "redirects when data is valid", %{conn: conn, hardware_set: hardware_set} do
      conn = put(conn, ~p"/hardware/#{hardware_set}", hardware_set: @update_attrs)
      assert redirected_to(conn) == ~p"/hardware/#{hardware_set}"

      conn = get(conn, ~p"/hardware/#{hardware_set}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, hardware_set: hardware_set} do
      conn = put(conn, ~p"/hardware/#{hardware_set}", hardware_set: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Hardware set"
    end
  end

  describe "delete hardware_set" do
    setup [:create_hardware_set]

    test "deletes chosen hardware_set", %{conn: conn, hardware_set: hardware_set} do
      conn = delete(conn, ~p"/hardware/#{hardware_set}")
      assert redirected_to(conn) == ~p"/hardware"

      assert_error_sent 404, fn ->
        get(conn, ~p"/hardware/#{hardware_set}")
      end
    end
  end

  defp create_hardware_set(_) do
    hardware_set = hardware_set_fixture()
    %{hardware_set: hardware_set}
  end
end
