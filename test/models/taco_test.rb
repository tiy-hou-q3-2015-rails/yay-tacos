require "test_helper"

class TacoTest < ActiveSupport::TestCase
  def taco
    @taco ||= Taco.new
  end

  def test_sets_price
    taco.price = 5.05
    assert_equal 5.05, taco.price
  end
end
