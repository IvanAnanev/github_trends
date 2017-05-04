defmodule GithubTrends.PeriodicTask do
  use GenServer
  alias GithubTrends.TrendsTake

  @period 10 * 60_000 # 10 minutes

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def retake_trends() do
    GenServer.call(__MODULE__, :retake_trends)
  end

  def init(state) do
    timer = Process.send_after(self(), :work,  0)
    {:ok, %{timer: timer}}
  end

  def handle_call(:retake_trends, _from, %{timer: timer}) do
    :timer.cancel(timer)
    TrendsTake.call
    timer = Process.send_after(self(), :work, @period)
    {:reply, :ok, %{timer: timer}}
  end

  def handle_info(:work, state) do
    TrendsTake.call
    timer = Process.send_after(self(), :work, @period)
    {:noreply, %{timer: timer}}
  end

  def handle_info(_, state) do
    {:ok, state}
  end
end