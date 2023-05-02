class Address < ApplicationRecord
  belongs_to :employee
  accepts_nested_attributes_for :address
end
