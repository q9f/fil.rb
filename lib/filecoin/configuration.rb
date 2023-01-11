module Filecoin
  class Configuration
    attr_writer :default_wallet

    def default_wallet
      @default_wallet || ENV["FILECOIN_WALLET"]
    end
  end

  module Configurable
    def configuration
      @configuration ||= Configuration.new
    end

    alias config configuration

    def configure
      yield configuration
    end
  end
end
