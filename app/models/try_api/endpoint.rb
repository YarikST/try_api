module TryApi
  class Endpoint < TryApi::Base
    typesafe_accessor :api_prefix, String
    typesafe_accessor :host, String
    typesafe_accessor :port, Integer

    def to_json
      super.merge local_path: local_path, full_path: full_path, path: path
    end

    def path
      host = self.host || self.project.host
      port = self.port || self.project.port

      "#{ host }#{ port.blank? ? '' : (':' + port.to_s) }"
    end

    def full_path
      "#{ path }#{ local_path }"
    end

    def local_path
      "/#{ self.api_prefix || self.project.api_prefix }"
    end
  end
end