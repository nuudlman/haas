defmodule Haas.Repo.Migrations.CreateHardware do
  use Ecto.Migration

  def change do
    create table(:hardware) do
      add :project_id, :integer
      add :capacity, :integer
      add :available, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
