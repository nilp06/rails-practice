class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :password, confirmation: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  mount_uploader :image, ImageUploader
end
