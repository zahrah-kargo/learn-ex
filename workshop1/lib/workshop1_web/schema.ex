defmodule Workshop1Web.Schema do
  # required to make a module graphQL Schema
  use Absinthe.Schema
  # this is the resolver that will be used
  alias Workshop1Web.NewsResolver

    query do
    # this is the query entry point to our app
    end

    mutation do
    # this is the mutation entry point to our app
    end
  end
