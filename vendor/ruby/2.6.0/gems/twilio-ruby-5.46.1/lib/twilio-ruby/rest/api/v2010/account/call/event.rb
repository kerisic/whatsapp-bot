##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class CallContext < InstanceContext
            class EventList < ListResource
              ##
              # Initialize the EventList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The SID of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Call
              #   resource.
              # @param [String] call_sid The unique string that that we created to identify this
              #   Call resource.
              # @return [EventList] EventList
              def initialize(version, account_sid: nil, call_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, call_sid: call_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/#{@solution[:call_sid]}/Events.json"
              end

              ##
              # Lists EventInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(limit: nil, page_size: nil)
                self.stream(limit: limit, page_size: page_size).entries
              end

              ##
              # Streams EventInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields EventInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of EventInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of EventInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                EventPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of EventInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of EventInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                EventPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.EventList>'
              end
            end

            class EventPage < Page
              ##
              # Initialize the EventPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [EventPage] EventPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of EventInstance
              # @param [Hash] payload Payload response from the API
              # @return [EventInstance] EventInstance
              def get_instance(payload)
                EventInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.EventPage>'
              end
            end

            class EventInstance < InstanceResource
              ##
              # Initialize the EventInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The SID of the
              #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Call
              #   resource.
              # @param [String] call_sid The unique string that that we created to identify this
              #   Call resource.
              # @return [EventInstance] EventInstance
              def initialize(version, payload, account_sid: nil, call_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {'request' => payload['request'], 'response' => payload['response'], }
              end

              ##
              # @return [Hash] Call Request.
              def request
                @properties['request']
              end

              ##
              # @return [Hash] Call Response with Events.
              def response
                @properties['response']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Api.V2010.EventInstance>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                "<Twilio.Api.V2010.EventInstance>"
              end
            end
          end
        end
      end
    end
  end
end