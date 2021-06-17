defmodule AntifyWeb.PageController do
  use AntifyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
