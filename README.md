# GithubTrends

Test Task for Elixir Knowledge

## Test Task description

Implement a service, which will

  * Check GitHub API every X minutes and pull trending repositories;
    * Trending - with most number of Stars;
    * Please DO NOT user cron or anything like that;
  * Save received repositories in the database;
    * We’re expecting you to choose the database and explain us your decision;
    * It could be PostgreSQL, Mnesia, etc.

Service should provide a public API with three endpoints
  1. Get a repository by name or ID;
  2. Get all repositories;
  3. Start sync with Github;
    * Force sync should reset the internal timer for automatic sync.

Provide us with the CLI client for this service, which uses the above-mentioned API.
As an advanced level, build a simple SPA using ReactJS to work with yours API and do the same as CLI.

## Setup

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install`
  * Create Mnesia DB with `mix amnesia.create -d Database --disk`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


