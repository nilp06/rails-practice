class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def create
    redirect_to root_path
  end

  private

  def employee_paramas
    params.require(:employee).permit(:name, :email, :password, :password_confirmation, :gender, :address,
                                     :mobile_number, :document, :birth_date)
  end
end
