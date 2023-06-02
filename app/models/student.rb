class Student < ApplicationRecord
  validates :first_name, length: { minimum: 3, maximum: 20 }, presence: true
  validates :last_name, length: { minimum: 3, maximum: 20 }, presence: true
  validates :email, confirmation: true, presence: true,
                    format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: 'Email is not valid.' }, uniqueness: true
  validate :check_dob
  validates :email_confirmation, presence: true
  validates :phone_number, presence: true,
                           format: { with: /\A[6-9]{1}[0-9]{9}\Z/, message: 'Phone number is not valid.' }, uniqueness: true
  validates :department, inclusion: { in: %w[IT CE] }, exclusion: { in: %w[0], message: 'Please Select Department' }
  validates :terms_of_usage, acceptance: { message: 'You cannot proceed without accepting Terms of Usage' }
  HUMANIZED_ATTRIBUTES = {
    dob: '',
    terms_of_usage: ''
  }
  def check_dob
    return unless dob.present? && dob > Date.today

    errors.add(:base, "Date of Birth can't be in the future")
  end

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def self.department_choices
    [['Select department', '0'], ['IT', 'IT'], ['CE', 'CE']]
  end
end
