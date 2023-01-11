require "filecoin/types/cid"

module Filecoin
  module Types
    class DataRef
      attr_reader :transfer_type, :root, :piece_cid, :piece_size

      def initialize(transfer_type: nil, root:, piece_cid: nil, piece_size: nil)
        @transfer_type = transfer_type
        @root = Cid.new(root)
        @piece_cid = Cid.new(piece_cid)
        @piece_size = piece_size
      end

      def as_json
        hash = {
          "Root" => root.as_json,
        }

        hash["TransferType"] = transfer_type unless transfer_type.nil?
        hash["PieceCID"] = piece_cid.as_json unless piece_cid.nil?
        hash["PieceSize"] = piece_size unless piece_size.nil?

        hash
      end
    end
  end
end
