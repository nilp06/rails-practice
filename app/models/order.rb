class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  before_save :calculate_price

  private

  def calculate_price
    self.total_price = product.price * quantity
  end
end
