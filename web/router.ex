defmodule GithubTrends.Router do
  use GithubTrends.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GithubTrends do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", GithubTrends.Api, as: :api do
    pipe_through :api

    resources "/repositories", RepositoryController, only: [:index, :show]
  end
end
