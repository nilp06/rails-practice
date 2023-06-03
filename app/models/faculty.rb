class Faculty < ApplicationRecord
  validates :first_name, length: {minimum:3, maximum:20}, presence: true
  validates :last_name, length: {minimum:3, maximum:20}, presence: true 
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message:"Email is not valid." }, uniqueness: true
  validate :check_dob
  validates :phone_number, presence: true, format: {with: /\A[6-9]{1}[0-9]{9}\Z/, message:"Phone number is not valid."}, uniqueness: true
  validates :department, inclusion: {in: ["IT","CE"] }, exclusion:{in: %W(0), message: "Please Select Department"}
  validates :designation, inclusion: {in: ["Ass. Prof","Prof"]}, exclusion:{in: ["0","HOD","Sr. Prof"], message: "Please select valid Designation."}
  HUMANIZED_ATTRIBUTES = {
    :dob => "",
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
  after_create MyCallbacks.new
  before_create :initialize_counter
  before_update :update_counter
  after_update MyCallbacks.new
  before_destroy MyCallbacks.new
  after_destroy MyCallbacks.new, :log_message
  after_validation :calculate_age
  before_validation :add_default_date
  before_save :add_prefix_to_email
  after_create_commit :print_counter_cache

  private

  def initialize_counter
    self.counter = 0
  end
  
  def update_counter
    self.counter = self.counter + 1
    puts "This object is updated #{self.counter} times."
  end

  def calculate_age
    self.age = Date.today.year - dob.year
  end
  
  def print_counter_cache
    puts "total students #{Student.all.count}"
  end

  def add_default_date
    if self.dob.nil?
      self.dob = "01-01-1980"
    end    
  end

  def add_prefix_to_email
    if !self.email.include? "ror_demo"
      self.email = "ror_demo" + email
    end
  end
  
  def log_message
    puts "#{self.first_name} #{self.last_name} is deleted."
  end
  
end
