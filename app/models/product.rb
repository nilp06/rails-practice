class Product < ApplicationRecord
  # default_scope { where(is_active: true) }
  enum :status, { in_stock: 0, out_of_stock: 1, coming_soon: 2 }
  validates :title, uniqueness: true
  has_many :orders, dependent: :destroy
end
