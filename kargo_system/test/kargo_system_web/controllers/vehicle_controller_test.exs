defmodule KargoSystemWeb.VehicleControllerTest do
  use KargoSystemWeb.ConnCase

  import KargoSystem.VehiclesFixtures

  alias KargoSystem.Vehicles.Vehicle

  @create_attrs %{
    status: "some status",
    vehicle_plate: "some vehicle_plate"
  }
  @update_attrs %{
    status: "some updated status",
    vehicle_plate: "some updated vehicle_plate"
  }
  @invalid_attrs %{status: nil, vehicle_plate: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vehicles", %{conn: conn} do
      conn = get(conn, Routes.vehicle_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vehicle" do
    test "renders vehicle when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vehicle_path(conn, :create), vehicle: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.vehicle_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "status" => "some status",
               "vehicle_plate" => "some vehicle_plate"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vehicle_path(conn, :create), vehicle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vehicle" do
    setup [:create_vehicle]

    test "renders vehicle when data is valid", %{conn: conn, vehicle: %Vehicle{id: id} = vehicle} do
      conn = put(conn, Routes.vehicle_path(conn, :update, vehicle), vehicle: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.vehicle_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "status" => "some updated status",
               "vehicle_plate" => "some updated vehicle_plate"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, vehicle: vehicle} do
      conn = put(conn, Routes.vehicle_path(conn, :update, vehicle), vehicle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vehicle" do
    setup [:create_vehicle]

    test "deletes chosen vehicle", %{conn: conn, vehicle: vehicle} do
      conn = delete(conn, Routes.vehicle_path(conn, :delete, vehicle))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.vehicle_path(conn, :show, vehicle))
      end
    end
  end

  defp create_vehicle(_) do
    vehicle = vehicle_fixture()
    %{vehicle: vehicle}
  end
end
