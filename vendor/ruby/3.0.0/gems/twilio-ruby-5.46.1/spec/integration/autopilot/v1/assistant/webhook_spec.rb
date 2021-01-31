##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Webhook' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .webhooks('UMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://autopilot.twilio.com/v1/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks/UMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks/UMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "UMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_updated": "2015-07-30T20:00:00Z",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "unique_name": "unique_name",
          "events": "ondialogueend",
          "webhook_url": "https://example.com/url",
          "webhook_method": "POST"
      }
      ]
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks('UMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .webhooks.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://autopilot.twilio.com/v1/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "key": "webhooks",
              "page_size": 50,
              "next_page_url": null,
              "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks?PageSize=50&Page=0",
              "page": 0,
              "first_page_url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks?PageSize=50&Page=0",
              "previous_page_url": null
          },
          "webhooks": []
      }
      ]
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "key": "webhooks",
              "page_size": 50,
              "next_page_url": null,
              "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks?PageSize=50&Page=0",
              "page": 0,
              "first_page_url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks?PageSize=50&Page=0",
              "previous_page_url": null
          },
          "webhooks": [
              {
                  "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks/UMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "UMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "unique_name": "unique_name",
                  "events": "ondialogueend",
                  "webhook_url": "https://example.com/url",
                  "webhook_method": "POST"
              }
          ]
      }
      ]
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .webhooks.create(unique_name: 'unique_name', events: 'events', webhook_url: 'https://example.com')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'UniqueName' => 'unique_name',
        'Events' => 'events',
        'WebhookUrl' => 'https://example.com',
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://autopilot.twilio.com/v1/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks/UMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "UMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_updated": "2015-07-30T20:00:00Z",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "unique_name": "unique_name",
          "events": "ondialogueend",
          "webhook_url": "https://example.com/url",
          "webhook_method": "POST"
      }
      ]
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks.create(unique_name: 'unique_name', events: 'events', webhook_url: 'https://example.com')

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .webhooks('UMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://autopilot.twilio.com/v1/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks/UMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "url": "https://autopilot.twilio.com/v1/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks/UMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "UMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_updated": "2015-07-30T20:00:00Z",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "unique_name": "unique_name",
          "events": "ondialogueend",
          "webhook_url": "https://example.com/url",
          "webhook_method": "POST"
      }
      ]
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks('UMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .webhooks('UMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://autopilot.twilio.com/v1/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks/UMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.autopilot.v1.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks('UMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end