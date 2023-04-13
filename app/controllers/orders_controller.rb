class OrdersController < ApplicationController
  def change
    @employee = Employee.find(params[:id])
    if params[:flag] == '1'
      @employee.increment!(:no_of_order)
    elsif params[:flag] == '-1'
      @employee.decrement!(:no_of_order)
    else
      flash[:danger] = 'Wrong Operation.'
    end
    redirect_back fallback_location: root_path
  end
end
