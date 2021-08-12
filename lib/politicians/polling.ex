defmodule Politicians.Polling do
  @moduledoc """
  The Polling context.
  """

  import Ecto.Query, warn: false
  alias Politicians.Repo

  alias Politicians.Polling.Politician

  @doc """
  Returns the list of politicians.

  ## Examples

      iex> list_politicians()
      [%Politician{}, ...]

  """
  def list_politicians do
    Repo.all(Politician)
  end

  @doc """
  Gets a single politician.

  Raises `Ecto.NoResultsError` if the Politician does not exist.

  ## Examples

      iex> get_politician!(123)
      %Politician{}

      iex> get_politician!(456)
      ** (Ecto.NoResultsError)

  """
  def get_politician!(id), do: Repo.get!(Politician, id)

  @doc """
  Creates a politician.

  ## Examples

      iex> create_politician(%{field: value})
      {:ok, %Politician{}}

      iex> create_politician(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_politician(attrs \\ %{}) do
    %Politician{}
    |> Politician.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a politician.

  ## Examples

      iex> update_politician(politician, %{field: new_value})
      {:ok, %Politician{}}

      iex> update_politician(politician, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_politician(%Politician{} = politician, attrs) do
    politician
    |> Politician.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a politician.

  ## Examples

      iex> delete_politician(politician)
      {:ok, %Politician{}}

      iex> delete_politician(politician)
      {:error, %Ecto.Changeset{}}

  """
  def delete_politician(%Politician{} = politician) do
    Repo.delete(politician)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking politician changes.

  ## Examples

      iex> change_politician(politician)
      %Ecto.Changeset{data: %Politician{}}

  """
  def change_politician(%Politician{} = politician, attrs \\ %{}) do
    Politician.changeset(politician, attrs)
  end

  alias Politicians.Polling.Poll

  @doc """
  Returns the list of polls.

  ## Examples

      iex> list_polls()
      [%Poll{}, ...]

  """
  def list_polls do
    Repo.all(Poll)
  end

  @doc """
  Gets a single poll.

  Raises `Ecto.NoResultsError` if the Poll does not exist.

  ## Examples

      iex> get_poll!(123)
      %Poll{}

      iex> get_poll!(456)
      ** (Ecto.NoResultsError)

  """
  def get_poll!(id), do: Repo.get!(Poll, id)

  @doc """
  Creates a poll.

  ## Examples

      iex> create_poll(%{field: value})
      {:ok, %Poll{}}

      iex> create_poll(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_poll(attrs \\ %{}) do
    %Poll{}
    |> Poll.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a poll.

  ## Examples

      iex> update_poll(poll, %{field: new_value})
      {:ok, %Poll{}}

      iex> update_poll(poll, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_poll(%Poll{} = poll, attrs) do
    poll
    |> Poll.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a poll.

  ## Examples

      iex> delete_poll(poll)
      {:ok, %Poll{}}

      iex> delete_poll(poll)
      {:error, %Ecto.Changeset{}}

  """
  def delete_poll(%Poll{} = poll) do
    Repo.delete(poll)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking poll changes.

  ## Examples

      iex> change_poll(poll)
      %Ecto.Changeset{data: %Poll{}}

  """
  def change_poll(%Poll{} = poll, attrs \\ %{}) do
    Poll.changeset(poll, attrs)
  end
end
