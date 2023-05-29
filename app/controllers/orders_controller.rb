class OrdersController < ApplicationController
  before_action :set_product, except: %i[filter list]
  before_action :set_order, only: %i[update edit show destroy]
  def new
    @order = @product.orders.build
  end

  def show
    @customer = @order.customer
  end

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
    filtered_orders(params)
    render 'list'
  end

  def destroy
    @order.destroy

    redirect_to product_orders_path(@product), status: :see_other
  end

  private

  def find_orders
    @orders = Order.includes(:product)
  end

  def filter_by_name(name)
    @orders = @orders.merge(Product.unscoped.where('title like ?', "#{name}%")) unless name.empty?
  end

  def filter_by_price_range(start_price, end_price)
    @orders = @orders.merge(Product.unscoped.where('price >= ?', start_price.to_i)) unless start_price.empty?
    @orders = @orders.merge(Product.unscoped.where('price <= ?', end_price.to_i)) unless end_price.empty?
  end

  def filtered_orders(params)
    find_orders
    filter_by_name(params[:name])
    filter_by_price_range(params[:start], params[:end])
  end

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
