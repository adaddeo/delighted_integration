module DelightedHelpers
  def post_order
    order = PostOrder.new(@payload, @config)
    order.post!
  end

  def process_request
    begin
      yield
    rescue Delighted::Error => e
      result 500, e.message
    end
  end
end