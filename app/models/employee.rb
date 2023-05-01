class Employee < ApplicationRecord
  has_one_attached :document
  enum gender: %i[male female]
  validates :password, confirmation: true
  has_and_belongs_to_many :hobbies
end
