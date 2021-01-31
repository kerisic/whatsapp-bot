##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Insights
      class V1 < Version
        ##
        # Initialize the V1 version of Insights
        def initialize(domain)
          super
          @version = 'v1'
          @calls = nil
          @rooms = nil
        end

        ##
        # @param [String] sid The sid
        # @return [Twilio::REST::Insights::V1::CallContext] if sid was passed.
        # @return [Twilio::REST::Insights::V1::CallList]
        def calls(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @calls ||= CallList.new self
          else
            CallContext.new(self, sid)
          end
        end

        ##
        # @param [String] room_sid The room_sid
        # @return [Twilio::REST::Insights::V1::RoomContext] if room_sid was passed.
        # @return [Twilio::REST::Insights::V1::RoomList]
        def rooms(room_sid=:unset)
          if room_sid.nil?
            raise ArgumentError, 'room_sid cannot be nil'
          elsif room_sid == :unset
            @rooms ||= RoomList.new self
          else
            RoomContext.new(self, room_sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Insights::V1>'
        end
      end
    end
  end
end