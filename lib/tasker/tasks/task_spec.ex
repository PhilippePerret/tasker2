defmodule Tasker.Tasks.TaskSpec do
  use Ecto.Schema
  import Ecto.Changeset

  schema "task_specs" do
    field :script, :string
    field :description, :string
    field :titre, :string
    field :contenu, :string
    field :note, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task_spec, attrs) do
    task_spec
    |> cast(attrs, [:titre, :contenu, :description, :note, :script])
    |> validate_required([:titre, :contenu, :description, :note, :script])
  end
end
