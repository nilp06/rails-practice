class ProductsController < ApplicationController
  before_action :set_product, only: %i[update edit destroy show]
  before_action :check_admin?, except: %i[index show]
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
      redirect_to product_path(@product)
    else
      render :new, stats: :unprossable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit, status: :unprossable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path
  end

  private

  def check_admin?
    return if is_admin?

    redirect_to products_path, flash: { danger: 'You have not Acess to this page.' }
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
