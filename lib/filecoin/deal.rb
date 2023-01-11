require "dry-struct"
require "filecoin/deals/state"

module Filecoin
  class Deal < Dry::Struct
    attribute? :deal_id, Dry::Types["integer"].optional
    attribute? :duration, Dry::Types["integer"].optional
    attribute? :message, Dry::Types["string"].optional
    attribute? :piece_cid, Dry::Types["string"].optional
    attribute? :price_per_epoch, Dry::Types["string"].optional
    attribute? :proposal_cid, Dry::Types["string"].optional
    attribute? :provider, Dry::Types["string"].optional
    attribute? :size, Dry::Types["integer"].optional
    attribute? :state, Dry::Types["integer"].optional

    module ClassMethods
      def from_deal_info(deal_info) # rubocop:disable Metrics/MethodLength
        new(
          deal_id: deal_info["DealID"],
          duration: deal_info["Duration"],
          message: deal_info["Message"],
          piece_cid: deal_info.dig("PieceCID", "/"),
          price_per_epoch: deal_info["PricePerEpoch"],
          proposal_cid: deal_info.dig("ProposalCid", "/"),
          provider: deal_info["Provider"],
          size: deal_info["Size"],
          state: deal_info["State"],
        )
      end
    end

    extend ClassMethods
    include Deals::State

    def initialize(attrs = {})
      super
    end
  end
end
