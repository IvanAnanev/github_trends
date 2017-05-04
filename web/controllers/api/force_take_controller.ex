defmodule GithubTrends.Api.ForceTakeController do
  use GithubTrends.Web, :controller

  alias GithubTrends.PeriodicTask

  def index(conn, _params) do
    PeriodicTask.retake_trends
    render conn, message: "its take"
  end
end
