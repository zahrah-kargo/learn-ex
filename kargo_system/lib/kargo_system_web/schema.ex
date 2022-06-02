defmodule KargoSystemWeb.Schema do
  # required to make a module graphQL Schema
  use Absinthe.Schema
  # this is the resolver that will be used
  # alias KargoSystemWeb.TransporterResolver

  object :transporter do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :npwp_number, non_null(:string)
    field :phone_number, non_null(:string)
    field :status, non_null(:string)
  end

    query do
      @desc "Get all transporters"
      field :transporter_list, non_null(list_of(non_null(:transporter)))
    end

    mutation do
    # this is the mutation entry point to our app
    end
  end
