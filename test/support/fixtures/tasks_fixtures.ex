defmodule Tasker.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tasker.Tasks` context.
  """

  @doc """
  Generate a task_spec.
  """
  def task_spec_fixture(attrs \\ %{}) do
    {:ok, task_spec} =
      attrs
      |> Enum.into(%{
        contenu: "some contenu",
        description: "some description",
        note: "some note",
        script: "some script",
        titre: "some titre"
      })
      |> Tasker.Tasks.create_task_spec()

    task_spec
  end

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{

      })
      |> Tasker.Tasks.create_task()

    task
  end
end
