defmodule PoliticiansWeb.PollController do
  use PoliticiansWeb, :controller

  alias Politicians.Polling
  alias Politicians.Polling.Poll

  def index(conn, _params) do
    polls = Polling.list_polls()
    render(conn, "index.html", polls: polls)
  end

  def new(conn, _params) do
    changeset = Polling.change_poll(%Poll{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"poll" => poll_params}) do
    case Polling.create_poll(poll_params) do
      {:ok, poll} ->
        conn
        |> put_flash(:info, "Poll created successfully.")
        |> redirect(to: Routes.poll_path(conn, :show, poll))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    poll = Polling.get_poll!(id)
    render(conn, "show.html", poll: poll)
  end

  def edit(conn, %{"id" => id}) do
    poll = Polling.get_poll!(id)
    changeset = Polling.change_poll(poll)
    render(conn, "edit.html", poll: poll, changeset: changeset)
  end

  def update(conn, %{"id" => id, "poll" => poll_params}) do
    poll = Polling.get_poll!(id)

    case Polling.update_poll(poll, poll_params) do
      {:ok, poll} ->
        conn
        |> put_flash(:info, "Poll updated successfully.")
        |> redirect(to: Routes.poll_path(conn, :show, poll))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", poll: poll, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    poll = Polling.get_poll!(id)
    {:ok, _poll} = Polling.delete_poll(poll)

    conn
    |> put_flash(:info, "Poll deleted successfully.")
    |> redirect(to: Routes.poll_path(conn, :index))
  end
end
