module Filecoin
  module Types
    class PowerClaim
      module ClassMethods
        def from_as_json(as_json)
          new(
            quality_adjusted_power: Integer(as_json["QualityAdjPower"]),
            raw_byte_power: Integer(as_json["RawBytePower"]),
          )
        end
      end

      extend ClassMethods

      attr_reader :quality_adjusted_power, :raw_byte_power

      # raw_byte_power: Sum of raw byte power for a miner's (or of all miners') sectors
      # quality_adjusted_power: Sum of quality adjusted power for a miner's (or of all miners') sectors.
      def initialize(quality_adjusted_power:, raw_byte_power:)
        @quality_adjusted_power = quality_adjusted_power
        @raw_byte_power = raw_byte_power
      end
    end
  end
end
