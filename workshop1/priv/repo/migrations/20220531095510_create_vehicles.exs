defmodule Workshop1.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :vehicle_plate, :string
      add :status, :string

      timestamps()
    end
  end
end
