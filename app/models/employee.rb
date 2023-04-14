class Employee < ApplicationRecord
  validates :email, uniqueness: true
  default_scope { order(first_name: :asc) }
end
