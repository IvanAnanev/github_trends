defmodule GithubTrends.Api.RepositoryView do
  use GithubTrends.Web, :view

  def render("index.json", %{repositories: repositories}), do: repositories

  def render("show.json", %{repository: repository}), do: repository
end
