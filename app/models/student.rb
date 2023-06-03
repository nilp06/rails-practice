class Student < ApplicationRecord
  validates :first_name, length: {minimum:3, maximum:20}, presence: true
  validates :last_name, length: {minimum:3, maximum:20}, presence: true 
  validates :email, confirmation:true, presence: true, format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message:"Email is not valid." }, uniqueness: true
  validate :check_dob
  validates :email_confirmation, presence:true
  validates :phone_number, presence: true, format: {with: /\A[6-9]{1}[0-9]{9}\Z/, message:"Phone number is not valid."}, uniqueness: true
  validates :department, inclusion: {in: ["IT","CE"] }, exclusion: {in: %W(0), message: "Please Select Department"}
  validates :terms_of_usage, acceptance: {message: "You cannot proceed without accepting Terms of Usage"}
  HUMANIZED_ATTRIBUTES = {
    :dob => "",
    :terms_of_usage => "",
  }
  def check_dob
    return unless dob.present? && dob > Date.today
    errors.add(:base, "Date of Birth can't be in the future")
  end
  
  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super 
  end

  after_initialize MyCallbacks.new
  after_find MyCallbacks.new
  before_create MyCallbacks.new
  after_create :print_message
  before_update :update_counter
  after_update MyCallbacks.new
  before_create :initialize_counter
  before_destroy MyCallbacks.new
  after_destroy :print_message_delete ,if: :old
  after_touch MyCallbacks.new
  before_validation :add_default_date
  before_save :add_prefix_to_email
  after_create_commit :print_counter_cache
  
  private

  def initialize_counter
    self.counter = 0
  end
  
  def update_counter
    self.counter += 1
    puts "This object is updated #{self.counter} times."
  end

  def print_counter_cache
    puts "total students #{Student.all.count}"
  end

  def print_message_delete
    print "Student is deleted."
  end
  def add_default_date
    if self.dob.nil?
      self.dob = "01-01-1980"
    end    
  end

  def add_prefix_to_email
    self.email= "ror_demo" + email
  end

  def print_message
    puts "Email Validated"
  end

  def old
    puts "#{self.first_name} #{self.last_name} is deleted."
    age = Date.today.year-dob.year
    age >= 20
  end

  Student.skip_callback(:save, :before, :add_prefix_to_email)
end