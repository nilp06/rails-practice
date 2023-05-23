class OrdersController < ApplicationController
  before_action :set_employee

  def increment
    @employee.increment!(:no_of_order)
    redirect_back fallback_location: root_path
  end

  def decrement
    @employee.decrement!(:no_of_order)
    redirect_back fallback_location: root_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
