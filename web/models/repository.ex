defmodule GithubTrends.Repository do
  use Amnesia
  use Database

  def create_or_update(params) do
    Amnesia.transaction do
      Repository
        |> struct(params)
        |> Repository.write
    end
  end

  def find(repository_id) when is_integer(repository_id) do
    Amnesia.transaction do
      repository_id
        |> Repository.read
        |> wrap_to_map
    end
  end
  def find(repository_name) when is_bitstring(repository_name) do
    Amnesia.transaction do
      match = Repository.match!(full_name: repository_name)
      case match do
        nil -> nil
        _ ->
          %{values: [repository|_]} = match
          wrap_to_map(repository)
      end
    end
  end

  def all do
    Amnesia.transaction do
      %{values: values} = Repository.match!(_: "_")
      values
        |> Enum.map(fn(x) -> wrap_to_map(x) end)
        |> Enum.sort(&(&1[:stargazers_countid] >= &2[:stargazers_count]))
    end
  end

  defp wrap_to_map({_, id, full_name, html_url, description, stargazers_count, language}) do
    %{
      id: id,
      full_name: full_name,
      html_url: html_url,
      description: description,
      stargazers_count: stargazers_count,
      language: language
    }
  end
  defp wrap_to_map(%Repository{id: id, full_name: full_name, html_url: html_url, description: description, stargazers_count: stargazers_count, language: language}) do
    %{
      id: id,
      full_name: full_name,
      html_url: html_url,
      description: description,
      stargazers_count: stargazers_count,
      language: language
    }
  end
  defp wrap_to_map(_), do: nil
end
