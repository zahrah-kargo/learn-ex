defmodule Workshop1Web.TransporterControllerTest do
  use Workshop1Web.ConnCase

  import Workshop1.TransportersFixtures

  @create_attrs %{name: "some name", npwp_number: "some npwp_number", phone_number: "some phone_number", status: "some status"}
  @update_attrs %{name: "some updated name", npwp_number: "some updated npwp_number", phone_number: "some updated phone_number", status: "some updated status"}
  @invalid_attrs %{name: nil, npwp_number: nil, phone_number: nil, status: nil}

  describe "index" do
    test "lists all transporters", %{conn: conn} do
      conn = get(conn, Routes.transporter_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Transporters"
    end
  end

  describe "new transporter" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.transporter_path(conn, :new))
      assert html_response(conn, 200) =~ "New Transporter"
    end
  end

  describe "create transporter" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transporter_path(conn, :create), transporter: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.transporter_path(conn, :show, id)

      conn = get(conn, Routes.transporter_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Transporter"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.transporter_path(conn, :create), transporter: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Transporter"
    end
  end

  describe "edit transporter" do
    setup [:create_transporter]

    test "renders form for editing chosen transporter", %{conn: conn, transporter: transporter} do
      conn = get(conn, Routes.transporter_path(conn, :edit, transporter))
      assert html_response(conn, 200) =~ "Edit Transporter"
    end
  end

  describe "update transporter" do
    setup [:create_transporter]

    test "redirects when data is valid", %{conn: conn, transporter: transporter} do
      conn = put(conn, Routes.transporter_path(conn, :update, transporter), transporter: @update_attrs)
      assert redirected_to(conn) == Routes.transporter_path(conn, :show, transporter)

      conn = get(conn, Routes.transporter_path(conn, :show, transporter))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, transporter: transporter} do
      conn = put(conn, Routes.transporter_path(conn, :update, transporter), transporter: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Transporter"
    end
  end

  describe "delete transporter" do
    setup [:create_transporter]

    test "deletes chosen transporter", %{conn: conn, transporter: transporter} do
      conn = delete(conn, Routes.transporter_path(conn, :delete, transporter))
      assert redirected_to(conn) == Routes.transporter_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.transporter_path(conn, :show, transporter))
      end
    end
  end

  defp create_transporter(_) do
    transporter = transporter_fixture()
    %{transporter: transporter}
  end
end
