class CartItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :taco

  def price=(dollars)
    self.price_in_cents = dollars.to_f * 100
  end

  def price
    self.price_in_cents.to_i / 100.0
  end
end
