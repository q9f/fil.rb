module Filecoin
  module Types
    class StartDealParams
      attr_reader :data, :wallet, :miner, :epoch_price, :min_blocks_duration, :deal_start_epoch

      def initialize(data:, wallet: nil, miner:, epoch_price:, min_blocks_duration: nil, deal_start_epoch: nil)
        @data = data
        @wallet = wallet || Filecoin.config.default_wallet
        @miner = miner
        @epoch_price = epoch_price
        @min_blocks_duration = min_blocks_duration
        @deal_start_epoch = deal_start_epoch
      end

      def as_json
        hash = {
          "Data" => data.as_json,
          "Wallet" => wallet,
          "Miner" => miner,
          "EpochPrice" => epoch_price.to_s,
        }

        hash["MinBlocksDuration"] = min_blocks_duration unless min_blocks_duration.nil?
        hash["DealStartEpoch"] = deal_start_epoch unless deal_start_epoch.nil?

        hash
      end
    end
  end
end
