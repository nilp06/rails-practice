class OrdersController < ApplicationController
  before_action :check_admin?
  def index
    @orders = Order.includes(:product).all
  end

  private

  def check_admin?
    return unless is_admin?

    redirect_back fallback_location: root_path, flash: { danger: 'You have not Acess to this page.' }
  end
end
