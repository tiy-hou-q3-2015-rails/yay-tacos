require "test_helper"

class CartItemTest < ActiveSupport::TestCase
  def cart_item
    @cart_item ||= CartItem.new
  end


  def test_sets_price
    cart_item.price = 5.05
    assert_equal 5.05, cart_item.price
  end
end
