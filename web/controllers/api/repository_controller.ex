defmodule GithubTrends.Api.RepositoryController do
  use GithubTrends.Web, :controller

  alias GithubTrends.Repository

  def index(conn, _params) do
    repositories = Repository.all
    render conn, repositories: repositories
  end

  def show(conn, %{"id" => id}) do
    repository = Repository.find(id)
    render conn, repository: repository
  end
end
