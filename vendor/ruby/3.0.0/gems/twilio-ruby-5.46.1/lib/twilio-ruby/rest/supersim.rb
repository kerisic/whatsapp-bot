##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Supersim < Domain
      ##
      # Initialize the Supersim Domain
      def initialize(twilio)
        super

        @base_url = 'https://supersim.twilio.com'
        @host = 'supersim.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of supersim
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] sid The unique string that we created to identify the Command
      #   resource.
      # @return [Twilio::REST::Supersim::V1::CommandInstance] if sid was passed.
      # @return [Twilio::REST::Supersim::V1::CommandList]
      def commands(sid=:unset)
        self.v1.commands(sid)
      end

      ##
      # @param [String] sid The unique string that we created to identify the Fleet
      #   resource.
      # @return [Twilio::REST::Supersim::V1::FleetInstance] if sid was passed.
      # @return [Twilio::REST::Supersim::V1::FleetList]
      def fleets(sid=:unset)
        self.v1.fleets(sid)
      end

      ##
      # @param [String] sid The unique string that we created to identify the Network
      #   resource.
      # @return [Twilio::REST::Supersim::V1::NetworkInstance] if sid was passed.
      # @return [Twilio::REST::Supersim::V1::NetworkList]
      def networks(sid=:unset)
        self.v1.networks(sid)
      end

      ##
      # @param [String] sid The unique string that identifies the Network Access Profile
      #   resource.
      # @return [Twilio::REST::Supersim::V1::NetworkAccessProfileInstance] if sid was passed.
      # @return [Twilio::REST::Supersim::V1::NetworkAccessProfileList]
      def network_access_profiles(sid=:unset)
        self.v1.network_access_profiles(sid)
      end

      ##
      # @param [String] sid The unique string that identifies the Sim resource.
      # @return [Twilio::REST::Supersim::V1::SimInstance] if sid was passed.
      # @return [Twilio::REST::Supersim::V1::SimList]
      def sims(sid=:unset)
        self.v1.sims(sid)
      end

      ##
      # @return [Twilio::REST::Supersim::V1::UsageRecordInstance]
      def usage_records
        self.v1.usage_records()
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Supersim>'
      end
    end
  end
end