defmodule PtodoWeb.TodoController do
  use PtodoWeb, :controller

  alias Ptodo.Project
  alias Ptodo.Project.Todo

  def index(conn, _params) do
    todos = Project.list_todos()
    render(conn, :index, todos: todos)
  end

  def new(conn, _params) do
    changeset = Project.change_todo(%Todo{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"todo" => todo_params}) do
    case Project.create_todo(todo_params) do
      {:ok, todo} ->
        conn
        |> put_flash(:info, "Todo created successfully.")
        |> redirect(to: ~p"/todos/#{todo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Project.get_todo!(id)
    render(conn, :show, todo: todo)
  end

  def edit(conn, %{"id" => id}) do
    todo = Project.get_todo!(id)
    changeset = Project.change_todo(todo)
    render(conn, :edit, todo: todo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = Project.get_todo!(id)

    case Project.update_todo(todo, todo_params) do
      {:ok, todo} ->
        conn
        |> put_flash(:info, "Todo updated successfully.")
        |> redirect(to: ~p"/todos/#{todo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, todo: todo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Project.get_todo!(id)
    {:ok, _todo} = Project.delete_todo(todo)

    conn
    |> put_flash(:info, "Todo deleted successfully.")
    |> redirect(to: ~p"/todos")
  end
end
