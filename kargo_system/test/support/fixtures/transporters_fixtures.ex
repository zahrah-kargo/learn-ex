defmodule KargoSystem.TransportersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KargoSystem.Transporters` context.
  """

  @doc """
  Generate a transporter.
  """
  def transporter_fixture(attrs \\ %{}) do
    {:ok, transporter} =
      attrs
      |> Enum.into(%{
        name: "some name",
        npwp_number: "some npwp_number",
        phone_number: "some phone_number",
        status: "some status"
      })
      |> KargoSystem.Transporters.create_transporter()

    transporter
  end
end
