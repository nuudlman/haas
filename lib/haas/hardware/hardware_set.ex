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
    |> validate_number(:capacity, greater_than_or_equal_to: 0)
    |> validate_number(:available, greater_than_or_equal_to: 0)
    # |> validate_change(:available, :capacity, fn :available, :capacity ->
    #   if :available >= :capacity do
    #     {:error, :available, "available must be less than or equal to capacity"}
    #   else
    #     {:ok, :available}
    #   end
    # end)
  end
end
