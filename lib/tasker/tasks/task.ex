defmodule Tasker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tasks" do

    has_one :taskspec_id, Tasks.TaskSpec
    has_one :user_id, Comptes.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [])
    # |> cast_assoc(attrs, [:taskspec_id])
    # |> cast_assoc(attrs, [:user_id])
    |> validate_required([])
  end
end
