class CartsController < ApplicationController

  before_action :authenticate_user!

  before_action do
    @cart = @current_user.carts.last
    if @cart.blank?
      @cart = Cart.new
      @cart.user = @current_user
      @cart.save
    end
  end

  def add
    @taco = Taco.find params[:taco_id]

    cart_item = @cart.cart_items.find_by taco_id: @taco.id
    if cart_item.present?
      cart_item.quantity += 1
      cart_item.save
    else
      CartItem.create cart: @cart, taco: @taco, price: @taco.price
    end
    redirect_to shopping_cart_path
  end

  def remove
    @taco = Taco.find params[:taco_id]
    cart_item = @cart.cart_items.find_by(taco_id: @taco.id)
    cart_item.destroy
    redirect_to shopping_cart_path
  end

  def show
  end
end
