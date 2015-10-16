class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  include Payola::Sellable

  def price_in_dollars
    self.price.to_i / 100.0
  end

  def redirect_path(payola_sale)
    ## Where should we send them after it completes
    # option1 : thank you page
    # confirmation: lists the order and stuff
    "/confirmation/#{payola_sale.guid}"
  end

end
