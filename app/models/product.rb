class Product < ApplicationRecord
  validates :name ,uniqueness: true,presence: true
  validates :price, presence: true
  validates :name_should_start_with_D, on:create
  #custom validation
  private
  def name_should_start_with_D
    false
  end

  #callback
  before_save :change_category
  def chage_category
    self.categoty="all"
  end
end
