class PostOrder < DelightedService
  def post!
    create
  end

  def params
    {
        email: order['email'],
        name: [order['billing_address']['firstname'], order['billing_address']['lastname']].join(' '),
        delay: @config['delay'],
        properties: order['delighted_properties'],
        send: (@config['send'] != 'false')
    }
  end

  private

  def create
    begin
      @response = Delighted::Person.create(params)
      {
          id: @response.id,
          survey_scheduled_at: @response.survey_scheduled_at,
          summary: 'Successfully sent shipment to Delighted'
      }
    rescue Delighted::Error
      raise BadResponseError.new(@response)
    end
  end
end