defmodule KargoSystemWeb.TransporterResolver do
  alias KargoSystem.Transporter
  alias KargoSystem.Transporters.Transporter

  def transporter_list(_root, _args, _info) do
    {:ok, Transporter.list_transporters()}
  end
end
