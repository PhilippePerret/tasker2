defmodule Tasker.Repo.Migrations.CreateTaskScripts do
  use Ecto.Migration

  def change do
    create table(:task_scripts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :code, :string
      add :taskspec_id, references(:task_specs, on_delete: :nothing, type: :binary_id)
    
      timestamps(type: :utc_datetime)
    end

    # On ajoute la clé étrangère à la fiche des specs de tâches
    alter table(:task_specs) do
      add :task_script_id, references(:task_scripts, on_delete: :nothing, type: :binary_id)
    end

  end
end
