module Filecoin
  module Deals
    module State
      STATES = %i[
        unknown
        not_found
        proposal_rejected
        proposal_accepted
        staged
        sealing
        active
        expired
        slashed
        failing
        funds_ensured
        waiting_for_data_request
        validating
        waiting_for_acceptance
        transferring
        waiting_for_data
        verifying_data
        ensure_provider_funds
        ensure_client_funds
        provider_funding
        client_funding
        publish
        publishing
        error
        completed
      ].freeze

      STATES.each_with_index do |state, index|
        define_method("#{state}?") do
          self.state == index
        end
      end

      GOOD_STATES = %i[proposal_accepted sealing active].freeze
      BAD_STATES = %i[failing error].freeze
      PENDING_STATES = %i[
        ensure_client_funds client_funding funds_ensured
        waiting_for_data_request transferring validating
      ].freeze
      FINISHED_STATES = %i[slashed expired].freeze

      def bad?
        BAD_STATES.include?(STATES[state])
      end

      def finished?
        FINISHED_STATES.include?(STATES[state])
      end

      def good?
        GOOD_STATES.include?(STATES[state])
      end

      def pending?
        PENDING_STATES.include?(STATES[state])
      end
    end
  end
end
