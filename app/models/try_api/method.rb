module TryApi
  class Method < TryApi::Base
    typesafe_accessor :title, String
    typesafe_accessor :description, String
    typesafe_accessor :parameters, Array, items_type: TryApi::Parameter
    typesafe_accessor :headers, Array, items_type: TryApi::Header
    typesafe_accessor :cookies, Array, items_type: TryApi::Cookie
    typesafe_accessor :path, String
    typesafe_accessor :method, String
    typesafe_accessor :example_responses, Array, items_type: TryApi::ExampleResponse
    typesafe_accessor :identifier, Hash
    typesafe_accessor :endpoint, TryApi::Endpoint
    typesafe_accessor :identifier_parameters, Array, items_type: TryApi::Parameter
    typesafe_accessor :action, String

    alias_method :method_endpoint, :endpoint

    def endpoint
      method_endpoint || project.endpoint
    end

    def full_path
      "#{endpoint.full_path}#{ self.path }"
    end

    def local_path
      "/#{ endpoint.api_prefix }#{ self.path }"
    end

    def to_json(id)
      super(id).merge endpoint: endpoint.to_json, full_path: full_path, local_path: local_path
    end
  end
end