defmodule TrendsTake do
  alias GithubTrends.Repository

  @search_params %{q: "stars:>20000", sort: "stars"}
  @search_result_repositories_info_field "items"
  @repository_saving_fields ["id", "full_name", "html_url", "description", "stargazers_count", "language"]

  def call do
    @search_params
      |> Tentacat.Search.repositories(github_client())
      |> take_repositories
      |> Enum.map(&take_fields/1)
      |> Repository.bulk_write
  end

  defp github_client do
    Tentacat.Client.new(%{access_token: Application.get_env(:github_trends, :github_api)[:access_token]})
  end

  defp take_repositories(search_result) when is_map(search_result) do
    Map.fetch!(search_result, @search_result_repositories_info_field)
  end
  defp take_repositories(search_result) when is_list(search_result) do
    Enum.reduce(search_result, [], fn(x, acc) -> acc ++ take_repositories(x) end)
  end

  defp take_fields(repository_info) do
    repository_info
      |> Map.take(@repository_saving_fields)
      |> atomize_map
  end

  defp atomize_map(map) do
    for {key, val} <- map, into: %{}, do: {String.to_atom(key), val}
  end
end
