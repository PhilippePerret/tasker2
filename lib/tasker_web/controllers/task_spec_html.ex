defmodule TaskerWeb.TaskSpecHTML do
  use TaskerWeb, :html

  embed_templates "task_spec_html/*"

  @doc """
  Renders a task_spec form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def task_spec_form(assigns)
end
