require 'spec_helper'

describe DelightedService do
  let(:order_payload) { FactoryRequests.order }
  let(:delighted_service) { DelightedService.new(order_payload, order_payload["parameters"]) }

  context "#new" do
    it "inits Delighted API key" do
      expect(Delighted).to receive(:api_key=)
      delighted_service
    end
  end

  context "#order" do
    it "returns order from payload" do
      delighted_service.instance_variable_set(:@payload, order_payload)
      expect(delighted_service.send(:order)).to eq(order_payload['order'])
    end
  end

  context "#api_key" do
    it "returns API key" do
      expect(delighted_service.send(:api_key)).to eq(order_payload['parameters']['delighted_api_key'])
    end
  end
end