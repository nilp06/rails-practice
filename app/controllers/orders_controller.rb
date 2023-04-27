class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:product).all
  end
end
