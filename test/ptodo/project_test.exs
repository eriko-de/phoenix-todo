defmodule Ptodo.ProjectTest do
  use Ptodo.DataCase

  alias Ptodo.Project

  describe "todos" do
    alias Ptodo.Project.Todo

    import Ptodo.ProjectFixtures

    @invalid_attrs %{}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Project.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Project.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{}

      assert {:ok, %Todo{} = todo} = Project.create_todo(valid_attrs)
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Project.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{}

      assert {:ok, %Todo{} = todo} = Project.update_todo(todo, update_attrs)
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Project.update_todo(todo, @invalid_attrs)
      assert todo == Project.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Project.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Project.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Project.change_todo(todo)
    end
  end

  describe "todos" do
    alias Ptodo.Project.Todo

    import Ptodo.ProjectFixtures

    @invalid_attrs %{title: nil, completed_at: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Project.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Project.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{title: "some title", completed_at: ~N[2023-12-02 20:01:00]}

      assert {:ok, %Todo{} = todo} = Project.create_todo(valid_attrs)
      assert todo.title == "some title"
      assert todo.completed_at == ~N[2023-12-02 20:01:00]
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Project.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{title: "some updated title", completed_at: ~N[2023-12-03 20:01:00]}

      assert {:ok, %Todo{} = todo} = Project.update_todo(todo, update_attrs)
      assert todo.title == "some updated title"
      assert todo.completed_at == ~N[2023-12-03 20:01:00]
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Project.update_todo(todo, @invalid_attrs)
      assert todo == Project.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Project.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Project.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Project.change_todo(todo)
    end
  end
end
