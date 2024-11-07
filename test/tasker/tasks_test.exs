defmodule Tasker.TasksTest do
  use Tasker.DataCase

  alias Tasker.Tasks

  describe "task_specs" do
    alias Tasker.Tasks.TaskSpec

    import Tasker.TasksFixtures

    @invalid_attrs %{script: nil, description: nil, titre: nil, contenu: nil, note: nil}

    test "list_task_specs/0 returns all task_specs" do
      task_spec = task_spec_fixture()
      assert Tasks.list_task_specs() == [task_spec]
    end

    test "get_task_spec!/1 returns the task_spec with given id" do
      task_spec = task_spec_fixture()
      assert Tasks.get_task_spec!(task_spec.id) == task_spec
    end

    test "create_task_spec/1 with valid data creates a task_spec" do
      valid_attrs = %{script: "some script", description: "some description", titre: "some titre", contenu: "some contenu", note: "some note"}

      assert {:ok, %TaskSpec{} = task_spec} = Tasks.create_task_spec(valid_attrs)
      assert task_spec.script == "some script"
      assert task_spec.description == "some description"
      assert task_spec.titre == "some titre"
      assert task_spec.contenu == "some contenu"
      assert task_spec.note == "some note"
    end

    test "create_task_spec/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task_spec(@invalid_attrs)
    end

    test "update_task_spec/2 with valid data updates the task_spec" do
      task_spec = task_spec_fixture()
      update_attrs = %{script: "some updated script", description: "some updated description", titre: "some updated titre", contenu: "some updated contenu", note: "some updated note"}

      assert {:ok, %TaskSpec{} = task_spec} = Tasks.update_task_spec(task_spec, update_attrs)
      assert task_spec.script == "some updated script"
      assert task_spec.description == "some updated description"
      assert task_spec.titre == "some updated titre"
      assert task_spec.contenu == "some updated contenu"
      assert task_spec.note == "some updated note"
    end

    test "update_task_spec/2 with invalid data returns error changeset" do
      task_spec = task_spec_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task_spec(task_spec, @invalid_attrs)
      assert task_spec == Tasks.get_task_spec!(task_spec.id)
    end

    test "delete_task_spec/1 deletes the task_spec" do
      task_spec = task_spec_fixture()
      assert {:ok, %TaskSpec{}} = Tasks.delete_task_spec(task_spec)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task_spec!(task_spec.id) end
    end

    test "change_task_spec/1 returns a task_spec changeset" do
      task_spec = task_spec_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task_spec(task_spec)
    end
  end

  describe "tasks" do
    alias Tasker.Tasks.Task

    import Tasker.TasksFixtures

    @invalid_attrs %{}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{}

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
