class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.find_or_create_by(employee_params)

    if @employee.save
      redirect_to @employee
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employee = Employee.find_or_initialize_by(id: params[:id])
    redirect_to new_employee_path if @employee.email.blank?
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to employees_path, status: :see_other
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary)
  end
end
