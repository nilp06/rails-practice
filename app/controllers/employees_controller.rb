class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show update edit destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @employee.addresses.build
  end

  def edit; end

  def show
    @hobbies = @employee.hobbies
    @addresses = @employee.addresses
  end

  def update
    if @employee.update(employee_paramas)
      redirect_to employee_path(@employee)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @employee = Employee.new(employee_paramas)
    if @employee.save && params[:employee][:hobby_ids].present?
      @employee.hobbies << Hobby.where(id: params[:employee][:hobby_ids])
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy

    redirect_to employees_path
  end

  def search
    return unless params[:query].present?

    @employees = Employee.where('name like ? ', "#{params[:query]}%")
  end

  private

  def employee_paramas
    params.require(:employee).permit(:name, :email, :password, :password_confirmation, :gender, :address,
                                     :mobile_number, :document, :birth_date, hobby_ids: [], addresses_attributes: %i[id house_name street_name road])
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
