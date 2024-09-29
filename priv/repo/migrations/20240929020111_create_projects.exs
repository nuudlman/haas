defmodule Haas.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
