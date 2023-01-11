module Filecoin
  module Types
    class Cid
      attr_reader :target

      def self.new(target)
        return nil if target.nil?
        return target if target.is_a?(Cid)

        super
      end

      def initialize(target)
        @target = target
      end

      def valid?
        !target.nil? && !target.empty?
      end

      def as_json
        {
          "/" => target,
        }
      end
    end
  end
end
