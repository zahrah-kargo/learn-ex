defmodule KargoSystem.VehiclesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KargoSystem.Vehicles` context.
  """

  @doc """
  Generate a vehicle.
  """
  def vehicle_fixture(attrs \\ %{}) do
    {:ok, vehicle} =
      attrs
      |> Enum.into(%{
        status: "some status",
        vehicle_plate: "some vehicle_plate"
      })
      |> KargoSystem.Vehicles.create_vehicle()

    vehicle
  end
end
