defmodule Haas.Hardware.HardwareSet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hardware" do
    field :available, :integer
    field :project_id, :integer
    field :capacity, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(hardware_set, attrs) do
    hardware_set
    |> cast(attrs, [:project_id, :capacity, :available])
    |> validate_required([:project_id, :capacity, :available])
  end
end
