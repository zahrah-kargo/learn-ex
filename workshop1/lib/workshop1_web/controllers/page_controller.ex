defmodule Workshop1Web.PageController do
  use Workshop1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
