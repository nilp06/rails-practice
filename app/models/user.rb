class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, confirmation: true
  has_many :enrollments
  has_many :events, through: :enrollments
  has_one :profile
end
