defmodule Politicians.PollingTest do
  use Politicians.DataCase

  alias Politicians.Polling

  describe "politicians" do
    alias Politicians.Polling.Politician

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def politician_fixture(attrs \\ %{}) do
      {:ok, politician} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Polling.create_politician()

      politician
    end

    test "list_politicians/0 returns all politicians" do
      politician = politician_fixture()
      assert Polling.list_politicians() == [politician]
    end

    test "get_politician!/1 returns the politician with given id" do
      politician = politician_fixture()
      assert Polling.get_politician!(politician.id) == politician
    end

    test "create_politician/1 with valid data creates a politician" do
      assert {:ok, %Politician{} = politician} = Polling.create_politician(@valid_attrs)
      assert politician.name == "some name"
    end

    test "create_politician/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Polling.create_politician(@invalid_attrs)
    end

    test "update_politician/2 with valid data updates the politician" do
      politician = politician_fixture()

      assert {:ok, %Politician{} = politician} =
               Polling.update_politician(politician, @update_attrs)

      assert politician.name == "some updated name"
    end

    test "update_politician/2 with invalid data returns error changeset" do
      politician = politician_fixture()
      assert {:error, %Ecto.Changeset{}} = Polling.update_politician(politician, @invalid_attrs)
      assert politician == Polling.get_politician!(politician.id)
    end

    test "delete_politician/1 deletes the politician" do
      politician = politician_fixture()
      assert {:ok, %Politician{}} = Polling.delete_politician(politician)
      assert_raise Ecto.NoResultsError, fn -> Polling.get_politician!(politician.id) end
    end

    test "change_politician/1 returns a politician changeset" do
      politician = politician_fixture()
      assert %Ecto.Changeset{} = Polling.change_politician(politician)
    end
  end

  describe "polls" do
    alias Politicians.Polling.Poll

    @valid_attrs %{description: "some description", title: "some title", took_place_at: "2010-04-17T14:00:00Z"}
    @update_attrs %{description: "some updated description", title: "some updated title", took_place_at: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{description: nil, title: nil, took_place_at: nil}

    def poll_fixture(attrs \\ %{}) do
      {:ok, poll} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Polling.create_poll()

      poll
    end

    test "list_polls/0 returns all polls" do
      poll = poll_fixture()
      assert Polling.list_polls() == [poll]
    end

    test "get_poll!/1 returns the poll with given id" do
      poll = poll_fixture()
      assert Polling.get_poll!(poll.id) == poll
    end

    test "create_poll/1 with valid data creates a poll" do
      assert {:ok, %Poll{} = poll} = Polling.create_poll(@valid_attrs)
      assert poll.description == "some description"
      assert poll.title == "some title"
      assert poll.took_place_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_poll/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Polling.create_poll(@invalid_attrs)
    end

    test "update_poll/2 with valid data updates the poll" do
      poll = poll_fixture()
      assert {:ok, %Poll{} = poll} = Polling.update_poll(poll, @update_attrs)
      assert poll.description == "some updated description"
      assert poll.title == "some updated title"
      assert poll.took_place_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_poll/2 with invalid data returns error changeset" do
      poll = poll_fixture()
      assert {:error, %Ecto.Changeset{}} = Polling.update_poll(poll, @invalid_attrs)
      assert poll == Polling.get_poll!(poll.id)
    end

    test "delete_poll/1 deletes the poll" do
      poll = poll_fixture()
      assert {:ok, %Poll{}} = Polling.delete_poll(poll)
      assert_raise Ecto.NoResultsError, fn -> Polling.get_poll!(poll.id) end
    end

    test "change_poll/1 returns a poll changeset" do
      poll = poll_fixture()
      assert %Ecto.Changeset{} = Polling.change_poll(poll)
    end
  end
end
