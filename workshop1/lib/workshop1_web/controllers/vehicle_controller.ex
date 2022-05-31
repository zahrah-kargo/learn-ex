defmodule Workshop1Web.VehicleController do
  use Workshop1Web, :controller

  alias Workshop1.Vehicles
  alias Workshop1.Vehicles.Vehicle

  def index(conn, _params) do
    vehicles = Vehicles.list_vehicles()
    render(conn, "index.html", vehicles: vehicles)
  end

  def new(conn, _params) do
    changeset = Vehicles.change_vehicle(%Vehicle{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vehicle" => vehicle_params}) do
    case Vehicles.create_vehicle(vehicle_params) do
      {:ok, vehicle} ->
        conn
        |> put_flash(:info, "Vehicle created successfully.")
        |> redirect(to: Routes.vehicle_path(conn, :show, vehicle))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vehicle = Vehicles.get_vehicle!(id)
    render(conn, "show.html", vehicle: vehicle)
  end

  def edit(conn, %{"id" => id}) do
    vehicle = Vehicles.get_vehicle!(id)
    changeset = Vehicles.change_vehicle(vehicle)
    render(conn, "edit.html", vehicle: vehicle, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vehicle" => vehicle_params}) do
    vehicle = Vehicles.get_vehicle!(id)

    case Vehicles.update_vehicle(vehicle, vehicle_params) do
      {:ok, vehicle} ->
        conn
        |> put_flash(:info, "Vehicle updated successfully.")
        |> redirect(to: Routes.vehicle_path(conn, :show, vehicle))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", vehicle: vehicle, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehicle = Vehicles.get_vehicle!(id)
    {:ok, _vehicle} = Vehicles.delete_vehicle(vehicle)

    conn
    |> put_flash(:info, "Vehicle deleted successfully.")
    |> redirect(to: Routes.vehicle_path(conn, :index))
  end
end
