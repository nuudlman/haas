defmodule HaasWeb.PageController do
  use HaasWeb, :controller

  def redirect_to_login(conn, _params) do
    # The user must log in to do anything in the application
    redirect(conn, to: ~p"/users/log_in")
  end
end
