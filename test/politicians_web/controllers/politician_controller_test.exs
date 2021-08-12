defmodule PoliticiansWeb.PoliticianControllerTest do
  use PoliticiansWeb.ConnCase

  alias Politicians.Polling

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:politician) do
    {:ok, politician} = Polling.create_politician(@create_attrs)
    politician
  end

  describe "index" do
    test "lists all politicians", %{conn: conn} do
      conn = get(conn, Routes.politician_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Politicians"
    end
  end

  describe "new politician" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.politician_path(conn, :new))
      assert html_response(conn, 200) =~ "New Politician"
    end
  end

  describe "create politician" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.politician_path(conn, :create), politician: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.politician_path(conn, :show, id)

      conn = get(conn, Routes.politician_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Politician"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.politician_path(conn, :create), politician: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Politician"
    end
  end

  describe "edit politician" do
    setup [:create_politician]

    test "renders form for editing chosen politician", %{conn: conn, politician: politician} do
      conn = get(conn, Routes.politician_path(conn, :edit, politician))
      assert html_response(conn, 200) =~ "Edit Politician"
    end
  end

  describe "update politician" do
    setup [:create_politician]

    test "redirects when data is valid", %{conn: conn, politician: politician} do
      conn =
        put(conn, Routes.politician_path(conn, :update, politician), politician: @update_attrs)

      assert redirected_to(conn) == Routes.politician_path(conn, :show, politician)

      conn = get(conn, Routes.politician_path(conn, :show, politician))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, politician: politician} do
      conn =
        put(conn, Routes.politician_path(conn, :update, politician), politician: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Politician"
    end
  end

  describe "delete politician" do
    setup [:create_politician]

    test "deletes chosen politician", %{conn: conn, politician: politician} do
      conn = delete(conn, Routes.politician_path(conn, :delete, politician))
      assert redirected_to(conn) == Routes.politician_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.politician_path(conn, :show, politician))
      end
    end
  end

  defp create_politician(_) do
    politician = fixture(:politician)
    %{politician: politician}
  end
end
