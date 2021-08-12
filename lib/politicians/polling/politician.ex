defmodule Politicians.Polling.Politician do
  use Ecto.Schema
  import Ecto.Changeset

  schema "politicians" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(politician, attrs) do
    politician
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
