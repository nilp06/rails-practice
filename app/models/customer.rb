class Customer < ApplicationRecord
  validates :email, uniqueness: true
  validates :phone_number, numericality: { length: 10 }
  has_many :orders
end
