class Product < ApplicationRecord
  #validation
  validates :name ,uniqueness: true,presence: true
  validates :price, presence: true

  #callback
  before_save :change_category
  def change_category
    self.category="all"
  end
end
