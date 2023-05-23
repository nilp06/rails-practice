class ProductsController < ApplicationController
  before_action :set_product, only: %i[update destroy edit show]

  def index
    @products = Product.includes(:orders).all
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path, status: :see_other
  end

  def filter
    puts params
    @products = Product.where(is_active: params[:filter][:inactive])
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :capacity, :is_active, :status, filter: {})
  end
end
