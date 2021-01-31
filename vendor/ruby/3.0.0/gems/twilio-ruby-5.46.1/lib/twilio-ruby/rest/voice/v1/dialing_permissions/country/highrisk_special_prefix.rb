##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Voice < Domain
      class V1 < Version
        class DialingPermissionsList < ListResource
          class CountryContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class HighriskSpecialPrefixList < ListResource
              ##
              # Initialize the HighriskSpecialPrefixList
              # @param [Version] version Version that contains the resource
              # @param [String] iso_code The {ISO country
              #   code}[https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2].
              # @return [HighriskSpecialPrefixList] HighriskSpecialPrefixList
              def initialize(version, iso_code: nil)
                super(version)

                # Path Solution
                @solution = {iso_code: iso_code}
                @uri = "/DialingPermissions/Countries/#{@solution[:iso_code]}/HighRiskSpecialPrefixes"
              end

              ##
              # Lists HighriskSpecialPrefixInstance records from the API as a list.
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
              # Streams HighriskSpecialPrefixInstance records from the API as an Enumerable.
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
              # When passed a block, yields HighriskSpecialPrefixInstance records from the API.
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
              # Retrieve a single page of HighriskSpecialPrefixInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of HighriskSpecialPrefixInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                HighriskSpecialPrefixPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of HighriskSpecialPrefixInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of HighriskSpecialPrefixInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                HighriskSpecialPrefixPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Voice.V1.HighriskSpecialPrefixList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class HighriskSpecialPrefixPage < Page
              ##
              # Initialize the HighriskSpecialPrefixPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [HighriskSpecialPrefixPage] HighriskSpecialPrefixPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of HighriskSpecialPrefixInstance
              # @param [Hash] payload Payload response from the API
              # @return [HighriskSpecialPrefixInstance] HighriskSpecialPrefixInstance
              def get_instance(payload)
                HighriskSpecialPrefixInstance.new(@version, payload, iso_code: @solution[:iso_code], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Voice.V1.HighriskSpecialPrefixPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class HighriskSpecialPrefixInstance < InstanceResource
              ##
              # Initialize the HighriskSpecialPrefixInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] iso_code The {ISO country
              #   code}[https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2].
              # @return [HighriskSpecialPrefixInstance] HighriskSpecialPrefixInstance
              def initialize(version, payload, iso_code: nil)
                super(version)

                # Marshaled Properties
                @properties = {'prefix' => payload['prefix'], }
              end

              ##
              # @return [String] A prefix that includes the E.164 assigned country code
              def prefix
                @properties['prefix']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Voice.V1.HighriskSpecialPrefixInstance>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                "<Twilio.Voice.V1.HighriskSpecialPrefixInstance>"
              end
            end
          end
        end
      end
    end
  end
end