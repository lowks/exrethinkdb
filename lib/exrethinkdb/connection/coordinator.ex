defmodule Exrethinkdb.Connection.Coordinator do
  use GenServer

  alias Exrethinkdb.Query
  alias Exrethinkdb.Connection

  def init(connections = [conn | _]) do
    Query.db("rethinkdb")
      |> Query.table("server_status")
      |> Query.pluck(["name", "network"])
      |> Connection.run conn
    {:ok, connections}
  end
  def handle_call({:get_conn, table}) do
      
  end
end
