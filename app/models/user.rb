class User < ApplicationRecord
  has_secure_password
<<<<<<< HEAD
  validates :email, presence: true
=======

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
>>>>>>> ea83a67 (feat:TE7-T120 active-record-query-interface:add authentication functionality)
end
