require "filecoin/client"
require "filecoin/configuration"
require "filecoin/types"
require "filecoin/version"
require "forwardable"

module Filecoin
  class << self
    extend Forwardable

    include Configurable

    def_delegators :client, *Client::Node.public_instance_methods

    def client
      Client.new
    end
  end
end
