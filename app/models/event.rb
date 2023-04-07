class Event < ApplicationRecord
  has_many :enrollments
  has_many :users, through: :enrollments, dependent: :destroy
  belongs_to :category
  has_many :comments, dependent: :destroy
end
