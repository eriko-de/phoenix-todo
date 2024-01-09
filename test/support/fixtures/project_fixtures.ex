defmodule Ptodo.ProjectFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ptodo.Project` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{

      })
      |> Ptodo.Project.create_todo()

    todo
  end

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        completed_at: ~N[2023-12-02 20:01:00],
        title: "some title"
      })
      |> Ptodo.Project.create_todo()

    todo
  end
end
