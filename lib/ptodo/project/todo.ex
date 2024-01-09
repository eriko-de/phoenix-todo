defmodule Ptodo.Project.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :title, :string
    field :completed_at, :naive_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:completed_at, :title])
    |> validate_required([:title])
  end
end
