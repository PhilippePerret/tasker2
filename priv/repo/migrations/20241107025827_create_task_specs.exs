defmodule Tasker.Repo.Migrations.CreateTaskSpecs do
  use Ecto.Migration

  def change do
    create table(:task_specs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :titre, :string
      add :contenu, :text
      add :description, :text
      add :note, :text
      add :script, :text

      timestamps(type: :utc_datetime)
    end
  end
end
