class DelightedService
  def initialize(payload, config)
    @payload, @config = payload, config
    authenticate
  end

  private

  def order
    @payload['order']
  end

  def order_number
    order['number']
  end

  def authenticate
    Delighted.api_key = api_key
  end

  def api_key
    @config['delighted_api_key']
  end
end