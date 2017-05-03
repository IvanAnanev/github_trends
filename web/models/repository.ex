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

  def find(id) do
    case Integer.parse(id) do
      {repository_id, ""} -> find_by_id(repository_id)
      _ -> find_by_name(id)
    end
  end

  defp find_by_id(id) when is_integer(id) do
    Amnesia.transaction do
      Repository.read(id)
    end
  end

  defp find_by_name(name) when is_bitstring(name) do
    Amnesia.transaction do
      match = Repository.match!(full_name: name)
      case match do
        nil -> nil
        _ ->
          %{values: [repository|_]} = match
          wrap_to_struct(repository)
      end
    end
  end

  def all do
    Amnesia.transaction do
      %{values: values} = Repository.match!(_: "_")
      values
        |> Enum.map(&wrap_to_struct/1)
        |> Enum.sort(&(&1.stargazers_count >= &2.stargazers_count))
    end
  end

  defp wrap_to_struct({_, id, full_name, html_url, description, stargazers_count, language}) do
    %Repository{
      id: id,
      full_name: full_name,
      html_url: html_url,
      description: description,
      stargazers_count: stargazers_count,
      language: language
    }
  end
end
