module WebStubs
  def stub_post_order(body)
    stub_request(:post, "https://api.delightedapp.com/v1/people").to_return(status: 200, body: body)
  end
end