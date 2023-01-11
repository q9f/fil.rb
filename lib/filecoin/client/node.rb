require "filecoin/types/cid"
require "filecoin/types/power_claim"

module Filecoin
  class Client
    module Node
      def chain_head
        json_rpc_call "Filecoin.ChainHead"
      end

      def client_get_deal_info(deal_id)
        params = Types::Cid.new(deal_id).as_json

        json_rpc_call "Filecoin.ClientGetDealInfo", params
      end

      def client_query_ask(peer_id, miner_id)
        json_rpc_call "Filecoin.ClientQueryAsk", peer_id, miner_id
      end

      def client_start_deal(start_deal_params, extract_response: false)
        params = if start_deal_params.is_a?(Hash)
            start_deal_params
          else
            start_deal_params.as_json
          end

        response = json_rpc_call("Filecoin.ClientStartDeal", params)

        extract_response ? response.dig("result", "/") : response
      end

      def net_peers
        json_rpc_call "Filecoin.NetPeers"
      end

      def state_power(extract_response: false)
        response = json_rpc_call "Filecoin.StateMinerPower", nil, nil

        if extract_response
          Types::PowerClaim.from_as_json(response.dig("result", "TotalPower"))
        else
          response
        end
      end
    end
  end
end
