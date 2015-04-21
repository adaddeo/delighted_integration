module Fixtures
  def load_fixture(name)
    IO.read(File.join(File.dirname(__FILE__), '..', 'fixtures', "#{name}.json"))
  end
end

module Factory
  class << self
    def trackings_to_shipments_result
      shipment = {
          id: FactoryRequests.shipment['shipment']['id'],
          status: FactoryResponses.tracking['data']['tracking']['tag'].downcase,
          aftership_tracking: FactoryResponses.tracking['data']['tracking'].except('checkpoints'),
          checkpoints: FactoryResponses.tracking['data']['tracking']['checkpoints']
      }
      [shipment]
    end

    def shipment_to_tracking_result
      tracking = FactoryResponses.tracking['data']['tracking']
      {
          'title'         => tracking['order_id'],
          'smses'         => tracking['smses'],
          'emails'        => tracking['emails'],
          'order_id'      => tracking['order_id'],
          'customer_name' => tracking['customer_name'],
          'custom_fields' => tracking['custom_fields']
      }
    end
  end
end

module FactoryRequests
  extend Fixtures

  class << self
    def order
      JSON.parse(load_fixture('order_request'))
    end
  end
end

module FactoryResponses
  extend Fixtures

  class << self
    def order_posted_successfully
      JSON.parse(load_fixture('post_order_success_response'))
    end
  end
end