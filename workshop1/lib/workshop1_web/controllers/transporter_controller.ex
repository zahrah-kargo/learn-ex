defmodule Workshop1Web.TransporterController do
  use Workshop1Web, :controller

  alias Workshop1.Transporters
  alias Workshop1.Transporters.Transporter

  def index(conn, _params) do
    transporters = Transporters.list_transporters()
    render(conn, "index.html", transporters: transporters)
  end

  def new(conn, _params) do
    changeset = Transporters.change_transporter(%Transporter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"transporter" => transporter_params}) do
    case Transporters.create_transporter(transporter_params) do
      {:ok, transporter} ->
        conn
        |> put_flash(:info, "Transporter created successfully.")
        |> redirect(to: Routes.transporter_path(conn, :show, transporter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    transporter = Transporters.get_transporter!(id)
    render(conn, "show.html", transporter: transporter)
  end

  def edit(conn, %{"id" => id}) do
    transporter = Transporters.get_transporter!(id)
    changeset = Transporters.change_transporter(transporter)
    render(conn, "edit.html", transporter: transporter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "transporter" => transporter_params}) do
    transporter = Transporters.get_transporter!(id)

    case Transporters.update_transporter(transporter, transporter_params) do
      {:ok, transporter} ->
        conn
        |> put_flash(:info, "Transporter updated successfully.")
        |> redirect(to: Routes.transporter_path(conn, :show, transporter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", transporter: transporter, changeset: changeset)
    end
  end

  def update_status(conn, %{"id" => id, "transporter" => transporter_params}) do
    transporter = Transporters.get_transporter!(id)
    status = transporter_params["status"]

    case Transporters.update_transporter(transporter, %{status: status}) do
      {:ok, transporter} ->
        conn
        |> put_flash(:info, "Transporter updated successfully.")
        |> redirect(to: Routes.transporter_path(conn, :show, transporter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", transporter: transporter, changeset: changeset)

      Ecto.NoResultsError ->
          {:error, :not_found, "No result found"}
    end
  end

  def delete(conn, %{"id" => id}) do
    transporter = Transporters.get_transporter!(id)
    {:ok, _transporter} = Transporters.delete_transporter(transporter)

    conn
    |> put_flash(:info, "Transporter deleted successfully.")
    |> redirect(to: Routes.transporter_path(conn, :index))
  end
end
