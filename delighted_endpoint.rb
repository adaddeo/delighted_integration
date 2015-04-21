# Sinatra
require 'sinatra'

# Spree endpoint
require 'endpoint_base'

# Delighted API client
require 'delighted'

# Delighted endpoint helpers
require './lib/delighted_helpers'
require './lib/delighted_service'
require './lib/post_order'

# Errors
require './lib/errors/delighted_error'
require './lib/errors/bad_response_error'

class DelightedEndpoint < EndpointBase::Sinatra::Base
  endpoint_key ENV["ENDPOINT_KEY"]
  helpers DelightedHelpers
  set :logging, true

  post '/add_order' do
    process_request do
      post_order
      result 200, 'Successfully sent order to Delighted.'
    end
  end
end