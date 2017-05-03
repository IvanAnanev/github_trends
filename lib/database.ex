require Amnesia
use Amnesia

defdatabase Database do
  deftable Repository, [:id, :full_name, :html_url, :description, :stargazers_count, :language], type: :ordered_set do
    @type t :: %Repository{id: non_neg_integer, full_name: String.t, html_url: String.t, description: String.t, stargazers_count: non_neg_integer, language: String.t}
  end
end
