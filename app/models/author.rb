class Author < ApplicationRecord
  has_many  :books,dependent: :destroy
  validates :first_name,presence: true,length: {minimum:3, maximum: 20}
  validates :last_name,presence: true,length: {minimum:3, maximum: 20}
  validates_date :dob,presence: true,on_or_before: lambda{Date.current} ,after: '1950-01-01'
  validates :email,presence: true,format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ },uniqueness: true
end
