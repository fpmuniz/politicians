defmodule Politicians.Repo.Migrations.CreatePoliticians do
  use Ecto.Migration

  def change do
    create table(:politicians) do
      add :name, :string

      timestamps()
    end
  end
end
