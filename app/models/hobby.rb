class Hobby < ApplicationRecord
  has_and_belongs_to_many :employees, dependent: :destroy
  validates :name, presence: true
end
