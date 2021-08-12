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
end
