defmodule Ptodo.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :completed_at, :naive_datetime
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
