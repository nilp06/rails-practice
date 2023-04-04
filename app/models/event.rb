class Event < ApplicationRecord
  has_many :enrollments
  has_many :users, through: :enrollments, dependent: :destroy
end
