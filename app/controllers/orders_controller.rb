class OrdersController < ApplicationController
  before_action :set_product, except: %i[filter list]
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

  def update
    if @order.update(order_params)
      redirect_to product_order_path(@product, @order)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def list
    @orders = Order.includes(:product)
  end

  def filter
    @orders = Order.joins(:product)
    @orders = @orders.merge(Product.unscoped.where('title like ?', "#{params[:name]}%")) unless params[:name].empty?
    @orders = @orders.merge(Product.unscoped.where('price >= ?', params[:start].to_i)) unless params[:start].empty?
    @orders = @orders.merge(Product.unscoped.where('price <= ?', params[:end].to_i)) unless params[:end].empty?
    render 'list'
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
