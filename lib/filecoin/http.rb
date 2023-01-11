require "json"
require "net/http"

module Filecoin
  module Http
    module ClassMethods
      def post(uri, token, data)
        return if uri.nil?

        req = Net::HTTP::Post.new(uri)
        req["Content-Type"] = "application/json"
        req["Authorization"] = "Bearer #{token}" unless token.nil?
        req.body = data.to_json

        response = request(req)
        JSON.parse(response.body)
      end

      def request(request)
        uri = request.uri

        return if uri.nil?

        Net::HTTP.new(uri.host, uri.port).request(request)
      end
    end

    extend ClassMethods
  end
end
