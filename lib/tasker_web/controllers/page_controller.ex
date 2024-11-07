defmodule TaskerWeb.PageController do
  use TaskerWeb, :controller

  # alias TaskerWeb.Gettext

  # plug :set_locale

  # defp set_locale(conn, _opts) do
  #   locale = get_session(conn, :locale) || "en"
  #   Gettext.put_locale(conn, locale)
  #   conn
  # end

  def home(conn, _params) do
    if conn.assigns[:current_user] do
      render(conn, :main)
    else
      render(conn, :home)
    end
  end

end
