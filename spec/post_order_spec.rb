require 'spec_helper'

describe PostOrder do
  let(:order_payload) { FactoryRequests.order }
  let(:order) { order_payload['order'] }
  let(:order_posted_successfully) { FactoryResponses.order_posted_successfully }
  let(:post_order) { PostOrder.new(order_payload, order_payload["parameters"]) }
  let(:tracking_result) { Factory.shipment_to_tracking_result }

  context "#post!" do
    it "creates person" do
      post_order.post!
    end
  end
end