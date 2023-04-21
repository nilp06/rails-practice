module Buisness
  class CustomersController < ApplicationController
    before_action :set_customer, only: %i[edit update preview destroy]
    def index
      @customers = Customer.all
    end

    def new
      @customer = Customer.new
    end

    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        redirect_to action: :index
      else
        render :new, status: :unprocessable_entity
      end
    end

    def search
      @customers = Customer.where('first_name like ?', "#{params[:name]}%")

      render 'index'
    end

    def preview; end

    def edit; end

    def destroy
      @customer.destroy

      redirect_to action: :index, status: :see_other
    end

    def update
      if @customer.update(customer_params)
        redirect_to action: :index
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :phone_number)
    end
  end
end
