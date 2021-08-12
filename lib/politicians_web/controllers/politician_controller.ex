defmodule PoliticiansWeb.PoliticianController do
  use PoliticiansWeb, :controller

  alias Politicians.Polling
  alias Politicians.Polling.Politician

  def index(conn, _params) do
    politicians = Polling.list_politicians()
    render(conn, "index.html", politicians: politicians)
  end

  def new(conn, _params) do
    changeset = Polling.change_politician(%Politician{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"politician" => politician_params}) do
    case Polling.create_politician(politician_params) do
      {:ok, politician} ->
        conn
        |> put_flash(:info, "Politician created successfully.")
        |> redirect(to: Routes.politician_path(conn, :show, politician))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    politician = Polling.get_politician!(id)
    render(conn, "show.html", politician: politician)
  end

  def edit(conn, %{"id" => id}) do
    politician = Polling.get_politician!(id)
    changeset = Polling.change_politician(politician)
    render(conn, "edit.html", politician: politician, changeset: changeset)
  end

  def update(conn, %{"id" => id, "politician" => politician_params}) do
    politician = Polling.get_politician!(id)

    case Polling.update_politician(politician, politician_params) do
      {:ok, politician} ->
        conn
        |> put_flash(:info, "Politician updated successfully.")
        |> redirect(to: Routes.politician_path(conn, :show, politician))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", politician: politician, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    politician = Polling.get_politician!(id)
    {:ok, _politician} = Polling.delete_politician(politician)

    conn
    |> put_flash(:info, "Politician deleted successfully.")
    |> redirect(to: Routes.politician_path(conn, :index))
  end
end
