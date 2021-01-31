##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Events < Domain
      class V1 < Version
        class SubscriptionContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class SubscribedEventList < ListResource
            ##
            # Initialize the SubscribedEventList
            # @param [Version] version Version that contains the resource
            # @param [String] subscription_sid The unique SID identifier of the Subscription.
            # @return [SubscribedEventList] SubscribedEventList
            def initialize(version, subscription_sid: nil)
              super(version)

              # Path Solution
              @solution = {subscription_sid: subscription_sid}
              @uri = "/Subscriptions/#{@solution[:subscription_sid]}/SubscribedEvents"
            end

            ##
            # Lists SubscribedEventInstance records from the API as a list.
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
            # Streams SubscribedEventInstance records from the API as an Enumerable.
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
            # When passed a block, yields SubscribedEventInstance records from the API.
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
            # Retrieve a single page of SubscribedEventInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of SubscribedEventInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              SubscribedEventPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of SubscribedEventInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of SubscribedEventInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              SubscribedEventPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Events.V1.SubscribedEventList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class SubscribedEventPage < Page
            ##
            # Initialize the SubscribedEventPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [SubscribedEventPage] SubscribedEventPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of SubscribedEventInstance
            # @param [Hash] payload Payload response from the API
            # @return [SubscribedEventInstance] SubscribedEventInstance
            def get_instance(payload)
              SubscribedEventInstance.new(@version, payload, subscription_sid: @solution[:subscription_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Events.V1.SubscribedEventPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class SubscribedEventInstance < InstanceResource
            ##
            # Initialize the SubscribedEventInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] subscription_sid The unique SID identifier of the Subscription.
            # @return [SubscribedEventInstance] SubscribedEventInstance
            def initialize(version, payload, subscription_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'type' => payload['type'],
                  'version' => payload['version'].to_i,
                  'subscription_sid' => payload['subscription_sid'],
                  'url' => payload['url'],
              }
            end

            ##
            # @return [String] Account SID.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] Type of event being subscribed to.
            def type
              @properties['type']
            end

            ##
            # @return [String] The schema version that the subscription should use.
            def version
              @properties['version']
            end

            ##
            # @return [String] Subscription SID.
            def subscription_sid
              @properties['subscription_sid']
            end

            ##
            # @return [String] The URL of this resource.
            def url
              @properties['url']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Events.V1.SubscribedEventInstance>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              "<Twilio.Events.V1.SubscribedEventInstance>"
            end
          end
        end
      end
    end
  end
end