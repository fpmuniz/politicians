defmodule Politicians.Polling.Poll do
  use Ecto.Schema
  import Ecto.Changeset

  schema "polls" do
    field :description, :string
    field :title, :string
    field :took_place_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(poll, attrs) do
    poll
    |> cast(attrs, [:title, :description, :took_place_at])
    |> validate_required([:title, :description, :took_place_at])
  end
end
