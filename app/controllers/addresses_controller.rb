class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.addressable = current_user
    @address.save
    redirect_to root_path, flash: { success: 'Address Added.' }
  end

  private

  def address_params
    params.require(:address).permit(:line1, :line2, :area, :city, :state)
  end
end
