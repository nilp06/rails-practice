class ProductsController < ApplicationController
  before_action :set_product, only: %i[update destroy edit show]

  def index
    @products = Product.all
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
    @option = params[:flag]
    if params[:flag] == '1'
      @products = Product.all
    elsif params[:flag] == '0'
      @products = Product.unscoped.where(is_active: false)
    else
      @option = '0'
      flash[:danger] = 'Something Went Wrong.'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :capacity, :is_active, :status)
  end
end
