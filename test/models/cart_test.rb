require "test_helper"

class CartTest < ActiveSupport::TestCase
  def cart
    @cart ||= Cart.new
  end

end
