# Une classe Script permet de programme un truc pour la tâche
defmodule Tasker.Tasks.TaskScript do
  @moduledoc """
  Permet de consigner un script associé à une tâche (et pouvoir le 
  réutiliser pour d'autres tâches aussi)
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Tasker.Tasks

  schema "task_scripts" do
    field :code, :string
    field :type, :string # pe ouverture de dossier, copie de fichier, etc.
    belongs_to :task_spec, Tasks.TaskSpec
  
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task_script, attrs) do
    task_script
    |> cast(attrs, [:code, :type])
    |> validate_required([:code, :type])
  end

end