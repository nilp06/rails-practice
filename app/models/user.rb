class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, confirmation: true
  has_many :enrollments, dependent: :destroy
  has_many :events, through: :enrollments
  has_one :profile, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :make_profile

  def make_profile
    create_profile
  end
end
