defmodule Tasker.Tasks.TaskSpec do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tasker.Tasks

  schema "task_specs" do
    field :description, :string
    field :titre, :string
    field :contenu, :string
    field :note, :string
    has_one :task_script, Tasks.TaskScript

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task_spec, attrs) do
    task_spec
    |> cast(attrs, [:titre, :contenu, :description, :note])
    |> validate_required([:titre, :contenu, :description, :note])
  end
end
