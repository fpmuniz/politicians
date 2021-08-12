defmodule PoliticiansWeb.PollControllerTest do
  use PoliticiansWeb.ConnCase

  alias Politicians.Polling

  @create_attrs %{description: "some description", title: "some title", took_place_at: "2010-04-17T14:00:00Z"}
  @update_attrs %{description: "some updated description", title: "some updated title", took_place_at: "2011-05-18T15:01:01Z"}
  @invalid_attrs %{description: nil, title: nil, took_place_at: nil}

  def fixture(:poll) do
    {:ok, poll} = Polling.create_poll(@create_attrs)
    poll
  end

  describe "index" do
    test "lists all polls", %{conn: conn} do
      conn = get(conn, Routes.poll_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Polls"
    end
  end

  describe "new poll" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.poll_path(conn, :new))
      assert html_response(conn, 200) =~ "New Poll"
    end
  end

  describe "create poll" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.poll_path(conn, :create), poll: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.poll_path(conn, :show, id)

      conn = get(conn, Routes.poll_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Poll"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.poll_path(conn, :create), poll: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Poll"
    end
  end

  describe "edit poll" do
    setup [:create_poll]

    test "renders form for editing chosen poll", %{conn: conn, poll: poll} do
      conn = get(conn, Routes.poll_path(conn, :edit, poll))
      assert html_response(conn, 200) =~ "Edit Poll"
    end
  end

  describe "update poll" do
    setup [:create_poll]

    test "redirects when data is valid", %{conn: conn, poll: poll} do
      conn = put(conn, Routes.poll_path(conn, :update, poll), poll: @update_attrs)
      assert redirected_to(conn) == Routes.poll_path(conn, :show, poll)

      conn = get(conn, Routes.poll_path(conn, :show, poll))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, poll: poll} do
      conn = put(conn, Routes.poll_path(conn, :update, poll), poll: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Poll"
    end
  end

  describe "delete poll" do
    setup [:create_poll]

    test "deletes chosen poll", %{conn: conn, poll: poll} do
      conn = delete(conn, Routes.poll_path(conn, :delete, poll))
      assert redirected_to(conn) == Routes.poll_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.poll_path(conn, :show, poll))
      end
    end
  end

  defp create_poll(_) do
    poll = fixture(:poll)
    %{poll: poll}
  end
end
