class OrdersController < ApplicationController
  def change
    @employee = Employee.find(params[:id])
    if params[:flag] == '1'
      @employee.increment!(:no_of_order)
    elsif params[:flag] == '-1'
      params[:flag] == '0'
      @employee.decrement!(:no_of_order)
    else
      flash[:dnager] = 'Wrong Operation.'
    end
    redirect_to employees_path
  end
end
