require "filecoin/client/node"
require "filecoin/http"

module Filecoin
  class Client
    include Filecoin::Client::Node

    attr_reader :uri, :token

    def initialize(opts = {})
      @uri = initialize_uri(opts)
      @token = initialize_token(opts)
    end

    private

    def initialize_uri(opts)
      uri = opts.fetch(:uri, ENV["FILECOIN_URL"])

      return if uri.nil?

      URI(uri)
    end

    def initialize_token(opts)
      opts.fetch(:token, ENV["FILECOIN_TOKEN"])
    end

    def json_rpc_call(method, *params)
      @json_rpc_call_id ||= 0
      @json_rpc_call_id += 1

      body = {
        jsonrpc: "2.0",
        method: method,
        params: params,
        id: @json_rpc_call_id,
      }

      Http.post(uri, token, body)
    end
  end
end
