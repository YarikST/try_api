module TryApi
  class Project < TryApi::Base
    typesafe_accessor :name, String
    typesafe_accessor :menu_items, Array, items_type: TryApi::MenuItem
    typesafe_accessor :protocol, String
    typesafe_accessor :variables, Hash, {}
    typesafe_accessor :endpoint, TryApi::Endpoint

    def to_json
      super.merge endpoint: endpoint.to_json
    end

  end
end