defmodule GithubTrends.Api.ForceTakeView do
  use GithubTrends.Web, :view

  def render("index.json", %{message: message}), do: message
end
