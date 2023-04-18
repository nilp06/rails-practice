class OrdersController < ApplicationController
  before_action :set_product
  before_action :set_order, only: %i[update edit show destroy]
  def new
    @order = @product.orders.build
  end

  def show; end

  def create
    @order = @product.orders.create(order_params)

    if @order.save
      redirect_to product_order_path(@product, @order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @orders = @product.orders
  end

  def edit; end

  def update
    puts '-------------hhhhhh------------------hhhhhhhh------------------------hhhhhh---------------------hhhhh---------------hhhhh---------'
    if @order.update(order_params)
      redirect_to product_order_path(@product, @order)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy

    redirect_to product_orders_path(@product), status: :see_other
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.require(:order).permit(:customer_id, :quantity, :status)
  end
end
