require 'spec_helper'

describe DelightedEndpoint do
  let(:order_payload) { FactoryRequests.order }
  let(:order_posted_successfully) { FactoryResponses.order_posted_successfully }

  #let(:trackings_result) { Factory.trackings_to_shipments_result }

  let(:config) do
    {
        parameters: {
            delighted_api_key: ENV['DELIGHTED_APIKEY'],
            delay: 0
        }
    }
  end

  context "POST :add_order" do
    it "calls create_or_add order" do
      receive_order_updater
      post '/add_order', order_payload.to_json, auth
      expect(last_response.status).to eq 200
    end

    it "returns success" do
      message = {
          order: {
              id: '123',
              email: 'anthony@personalwine.com',
              billing_address: {
                  firstname: 'Anthony',
                  lastname: 'Daddeo',
              }
          }
      }.merge! config

      VCR.use_cassette "add_orderv1" do
        post '/add_order', message.to_json, auth
        expect(json_response[:summary]).to match 'Successfully sent order to Delighted'
        expect(last_response.status).to eq 200
      end
    end
  end

  def receive_order_updater
    service = double('DelightedService')
    expect(service).to receive(:post!).and_return(order_posted_successfully["data"])
    expect(DelightedService).to receive(:new).with(order_payload, order_payload["parameters"]).and_return(service)
  end
end