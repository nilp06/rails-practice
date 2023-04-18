class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  enum :status, { booked: 0, canceled: 1 }
  before_save :calculate_price

  private

  def calculate_price
    self.total_price = product.price * quantity
  end
end
