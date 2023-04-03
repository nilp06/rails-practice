class CarsController < ApplicationController
  http_basic_authenticate_with name: 'dhh', password: 'secret', except: :index
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def search
    @cars = Car.where(name: params[:query])
  end

  def download
    pdf = Prawn::Document.new
    @cars = Car.all
    @cars.each do |car|
      pdf.text "#{car.name} - #{car.company} - #{car.price}"
    end
    send_data(pdf.render, filename: 'data.pdf', type: 'application/pdf')
  end

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to @car
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, status: :see_other
  end

  def record_not_found
    render 'error'
  end

  private

  def car_params
    params.require(:car).permit(:name, :company, :price)
  end
end
