defmodule HaasWeb.HardwareSetHTML do
  use HaasWeb, :html

  embed_templates "hardware_set_html/*"

  @doc """
  Renders a hardware_set form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def hardware_set_form(assigns)
end
