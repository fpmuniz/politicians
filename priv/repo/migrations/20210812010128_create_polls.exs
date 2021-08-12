defmodule Politicians.Repo.Migrations.CreatePolls do
  use Ecto.Migration

  def change do
    create table(:polls) do
      add :title, :string
      add :description, :string
      add :took_place_at, :utc_datetime

      timestamps()
    end

  end
end
