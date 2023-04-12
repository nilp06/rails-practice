class Employee < ApplicationRecord
  validates :email, uniqueness: true
end
