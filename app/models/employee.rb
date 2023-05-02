class Employee < ApplicationRecord
  mount_uploader :document, DocumentUploader
  has_one_attached :document
  enum gender: %i[male female]
  validates :password, confirmation: true
  validates :name, presence: true
  validates :gender, presence: true
  validates :mobile_number, presence: true
  validates :birth_date, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  has_and_belongs_to_many :hobbies, dependent: :destroy
  has_many :addresses, dependent: :destroy
end
