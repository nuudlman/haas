defmodule Haas.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :description, :string
      add :user_id, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
